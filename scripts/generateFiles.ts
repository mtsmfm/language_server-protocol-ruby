import ts from "typescript";
import * as fs from "fs";
import * as path from "path";
import { globSync } from "glob";

const lspVersion = "3.17";
const rootDir = path.normalize(path.join(__dirname, ".."));
const tempDir = path.join(rootDir, "tmp");
const protocolMdPath = path.join(tempDir, "protocol.md");

const createFile = (filePath: string, content: string) => {
  const dir = path.dirname(path.normalize(filePath));

  dir.split(/(?!^)\//).forEach((_, index, all) => {
    const dir = all.slice(0, index + 1).join("/");

    if (!fs.existsSync(dir)) {
      fs.mkdirSync(dir);
    }
  });

  fs.writeFileSync(filePath, content);
};

const extractTypeScriptSource = (content: string) => {
  const regEx = /^```typescript\r?\n([^]*?)^```\r?\n/gm;
  let match;
  let result = "";

  while ((match = regEx.exec(content)) !== null) {
    result = result.concat(match[1]);
  }

  return result;
};

type SerializeResult = {
  name: string;
  documentation: string;
  type: string;
  optional: boolean;
  nullable: boolean;
  value: string | null;
};
interface InterfaceResult {
  interface: SerializeResult;
  module?: undefined;
  members: SerializeResult[];
  allMembers: SerializeResult[];
}

interface ModuleResult {
  interface?: undefined;
  module: SerializeResult;
  members: SerializeResult[];
  allMembers?: undefined;
}

const extractDefinitions = (content: string) => {
  const fileName = path.join(tempDir, "protocol.ts");
  createFile(fileName, content);
  const program = ts.createProgram([fileName], {});
  const checker = program.getTypeChecker();

  const serialize = (member: ts.NamedDeclaration) => {
    const symbol = checker.getSymbolAtLocation(member.name!)!;
    const type = checker.getTypeOfSymbolAtLocation(
      symbol,
      symbol.valueDeclaration
    );
    const types =
      member.kind == ts.SyntaxKind.UnionType
        ? (<ts.UnionTypeNode>(<ts.PropertySignature>member).type).types
        : [];

    return {
      name: symbol.getName(),
      documentation: ts.displayPartsToString(
        symbol.getDocumentationComment(undefined)
      ),
      type: checker.typeToString(type),
      optional: ts.isTypeElement(member) && !!member.questionToken,
      nullable: (<ts.NodeArray<ts.TypeNode>>types).some(
        (t) => t.kind == ts.SyntaxKind.NullKeyword
      ),
      value: symbol.valueDeclaration
        ? symbol.valueDeclaration
            .getChildAt(symbol.valueDeclaration.getChildCount() - 1)
            .getText()
        : null,
    };
  };

  const output: Array<InterfaceResult | ModuleResult> = [];

  const handleInterface = (node: ts.InterfaceDeclaration) => {
    const members = node.members
      .filter((member) => member.name)
      .map((member) => serialize(member));
    const parentNames = node.heritageClauses?.flatMap((c) =>
      c.types.map((t) => t.expression.getText())
    );
    const parents = parentNames?.map((n) => {
      const p = output.find((i) => i.interface?.name === n);
      if (p) {
        return p as InterfaceResult;
      } else {
        throw `Interface ${n} is not found`;
      }
    });

    output.push({
      interface: serialize(node),
      allMembers: (parents || []).flatMap((p) => p.allMembers!).concat(members),
      members,
    });
  };

  const handleModule = (node: ts.ModuleDeclaration) => {
    const members: SerializeResult[] = [];

    ts.forEachChild(node.body!, (node) => {
      if (ts.isVariableStatement(node)) {
        members.push(serialize(node.declarationList.declarations[0]));
      }
    });

    output.push({
      module: serialize(node),
      members,
    });
  };

  const handleTypeAlias = (node: ts.TypeAliasDeclaration) => {
    if (!ts.isUnionTypeNode(node.type)) {
      console.log(`${node.name.text} is not UnionType`);
      return;
    }

    if (!node.type.types.every(ts.isTypeLiteralNode)) {
      console.log(`${node.name.text} contains other than TypeLiteral`);
      return;
    }

    const membersList = (<ts.NodeArray<ts.TypeLiteralNode>>node.type.types).map(
      (t) => {
        if (!t.members) {
          console.dir(t.kind);
          console.dir(node.name.text);
        }
        return t.members.map((m) => serialize(m));
      }
    );

    const allMembers = membersList
      .reduce((ary, xs) => [...ary, ...xs])
      .reduce((ary: string[], x) => [...new Set([...ary, x.name])], [])
      .map((name) => {
        const members = membersList.map(
          (members) => members.find((m) => m.name === name)!
        );

        const documentation = members
          .filter((m) => m !== undefined)
          .map((m) => m.documentation)
          .join("\n\n--- OR ---\n\n");
        const type = [
          ...new Set(members.filter((m) => m !== undefined).map((m) => m.type)),
        ].join("|");
        const optional = members.some((m) => m === undefined || m.optional);
        const nullable = members.some((m) => m === undefined || m.nullable);

        return {
          name,
          documentation,
          type,
          optional,
          nullable,
          value: null,
        };
      });

    output.push({
      interface: serialize(node),
      allMembers,
      members: allMembers,
    });
  };

  const handleEnum = (node: ts.EnumDeclaration) => {
    const members: SerializeResult[] = node.members.map((m) => serialize(m));

    output.push({
      module: serialize(node),
      members,
    });
  };

  ts.isInterfaceDeclaration;

  const pendingInterfaces: ts.InterfaceDeclaration[] = [];

  const visit = (node: ts.Node) => {
    if (ts.isInterfaceDeclaration(node)) {
      try {
        handleInterface(node as ts.InterfaceDeclaration);
      } catch {
        // XXX dirty hack to handle not parsed parent
        pendingInterfaces.push(node);
      }
    } else if (ts.isModuleDeclaration(node)) {
      handleModule(node);
    } else if (ts.isTypeAliasDeclaration(node)) {
      handleTypeAlias(node);
    } else if (ts.isEnumDeclaration(node)) {
      handleEnum(node);
    }
  };

  ts.forEachChild(program.getSourceFile(fileName)!, visit);

  pendingInterfaces.forEach((i) => handleInterface(i));

  return output;
};

import Handlebars from "handlebars";
const snake = (s: string) =>
  s
    .replace(/UTF/, (s) => s.toLowerCase()) // special case
    .replace(/^[A-Z]/, (s) => s.toLowerCase())
    .replace(/[A-Z]/g, (s) => `_${s.toLowerCase()}`);

Handlebars.registerHelper("params", (members: InterfaceResult["members"]) => {
  return members
    .map(
      (member) =>
        `${snake(member.name)}:${
          member.optional || member.nullable ? " nil" : ""
        }`
    )
    .join(", ");
});
Handlebars.registerHelper("snake", snake);
Handlebars.registerHelper("comment", (s: string, options) => {
  const indent = Array(options.hash.indent + 1).join(" ");
  return s
    .split("\n")
    .map((s) => s.trim())
    .map((s) => `${indent}#${s.length == 0 ? "" : ` ${s}`}`)
    .join("\n");
});
Handlebars.registerHelper("local_var", (s) => {
  const rubyKeywords = ["end", "retry"];
  const snaked = snake(s);

  if (rubyKeywords.some((k) => k == s)) {
    return `binding.local_variable_get(:${snaked})`;
  } else {
    return snake(s);
  }
});
Handlebars.registerHelper("const", (s) => {
  return snake(s).toUpperCase();
});
Handlebars.registerHelper("isliteral", (s: string) => {
  return s.match(/'.*'/) || s.match(/".*"/) || s.match(/\d+/);
});



const typeMapping = new Map<string, string>([
  ["string", "String"],
  ["number", "Integer"],
  ["boolean", "bool"],
  ["null", "nil"],
  ["undefined", "nil"],
  ["any", "untyped"],
  ["LSPAny", "untyped"],
]);

const convertTypeToRbs: ((type: string) => string) = (type) => {
  if (type.endsWith("[]")) {
    return `Array[${convertTypeToRbs(type.slice(0, -2))}]`;
  }
  let rbsType = typeMapping.get(type);
  if (rbsType != null) {
    return rbsType;
  }

  return "untyped";
};

Handlebars.registerHelper("method_signature", (members: InterfaceResult["members"]) => {
  return members
    .map(
      (member) =>
        `${member.optional ? "?" : ""}${snake(member.name)}: ${convertTypeToRbs(member.type)}${member.nullable ? "?" : ""}`
    )
    .join(", ");
});
Handlebars.registerHelper("convertTypeToRbs", convertTypeToRbs);

(async () => {
  const data = globSync(
    path.join(
      __dirname,
      "..",
      "language-server-protocol",
      "_specifications",
      "lsp",
      lspVersion,
      "**",
      "*.md"
    )
  )
    .sort()
    .map((f) => fs.readFileSync(f).toString())
    .join("\n");

  // For debug
  createFile(protocolMdPath, data);

  const md = fs.readFileSync(protocolMdPath).toString();
  const typeScriptSource = extractTypeScriptSource(md);

  const definitions = extractDefinitions(typeScriptSource);

  const isInterfaceResult = (
    d: InterfaceResult | ModuleResult
  ): d is InterfaceResult => {
    return !!d.interface;
  };

  const isModuleResult = (
    d: InterfaceResult | ModuleResult
  ): d is ModuleResult => {
    return !!d.module;
  };

  const interfaces = definitions.filter(isInterfaceResult);
  const modules = definitions.filter(isModuleResult);

  interfaces.forEach((definition) => {
    createFile(
      path.join(
        rootDir,
        "lib",
        "language_server",
        "protocol",
        "interface",
        `${snake(definition.interface.name)}.rb`
      ),
      Handlebars.compile(
        `
module LanguageServer
  module Protocol
    module Interface
      {{#if definition.interface.documentation}}
      #
{{comment definition.interface.documentation indent=6}}
      #
      {{/if}}
      class {{definition.interface.name}}
        def initialize({{params definition.allMembers}})
          @attributes = {}

          {{#each definition.allMembers}}
          @attributes[:{{name}}] = {{local_var name}}{{#if optional}} if {{local_var name}}{{/if}}
          {{/each}}

          @attributes.freeze
        end
        {{#each definition.allMembers}}

        {{#if documentation}}
        #
{{comment documentation indent=8}}
        #
        {{/if}}
        # @return [{{type}}{{#if nullable}}, nil{{/if}}]
        def {{snake name}}
          attributes.fetch(:{{name}})
        end
        {{/each}}

        attr_reader :attributes

        def to_hash
          attributes
        end

        def to_json(*args)
          to_hash.to_json(*args)
        end
      end
    end
  end
end
`.slice(1),
        { noEscape: true }
      )({ definition })
    );
  });

  interfaces.forEach((definition) => {
    createFile(
      path.join(
        rootDir,
        "sig",
        "language_server",
        "protocol",
        "interface",
        `${snake(definition.interface.name)}.rbs`
      ),
      Handlebars.compile(
        `
module LanguageServer
  module Protocol
    module Interface
      {{#if definition.interface.documentation}}
      #
{{comment definition.interface.documentation indent=6}}
      #
      {{/if}}
      class {{definition.interface.name}}
        def initialize: ({{method_signature definition.allMembers}}) -> void

        @attributes: Hash[Symbol, untyped]
        attr_reader attributes: Hash[Symbol, untyped]

        def to_hash: () -> Hash[Symbol, untyped]

        def to_json: (*untyped) -> String
      end
    end
  end
end
`.slice(1),
        { noEscape: true }
      )({ definition })
    );
  });

  modules.forEach((definition) => {
    createFile(
      path.join(
        rootDir,
        "lib",
        "language_server",
        "protocol",
        "constant",
        `${snake(definition.module.name)}.rb`
      ),
      Handlebars.compile(
        `
module LanguageServer
  module Protocol
    module Constant
      {{#if definition.module.documentation}}
      #
{{comment definition.module.documentation indent=6}}
      #
      {{/if}}
      module {{definition.module.name}}
        {{#each definition.members}}
        {{#if documentation}}
        #
{{comment documentation indent=8}}
        #
        {{/if}}
        {{#if (isliteral value)}}
        {{const name}} = {{value}}
        {{else}}
        {{const name}} = {{const value}}
        {{/if}}
        {{/each}}
      end
    end
  end
end
`.slice(1),
        { noEscape: true }
      )({ definition })
    );
  });

  modules.forEach((definition) => {
    createFile(
      path.join(
        rootDir,
        "sig",
        "language_server",
        "protocol",
        "constant",
        `${snake(definition.module.name)}.rbs`
      ),
      Handlebars.compile(
        `
module LanguageServer
  module Protocol
    module Constant
      {{#if definition.module.documentation}}
      #
{{comment definition.module.documentation indent=6}}
      #
      {{/if}}
      module {{definition.module.name}}
        {{#each definition.members}}
        {{#if documentation}}
        #
{{comment documentation indent=8}}
        #
        {{/if}}
        {{#if (isliteral value)}}
        {{const name}}: {{value}}
        {{else}}
        {{const name}}: {{convertTypeToRbs type}}
        {{/if}}
        {{/each}}
      end
    end
  end
end
`.slice(1),
        { noEscape: true }
      )({ definition })
    );
  });

  createFile(
    path.join(rootDir, "lib", "language_server", "protocol", "interface.rb"),
    Handlebars.compile(
      `
module LanguageServer
  module Protocol
    module Interface
{{#each names}}
      autoload :{{this}}, "language_server/protocol/interface/{{snake this}}"
{{/each}}

{{#each names}}
      require_relative "interface/{{snake this}}"
{{/each}}
    end
  end
end
`.slice(1),
      { noEscape: true }
    )({ names: interfaces.map((i) => i.interface.name).sort() })
  );

  createFile(
    path.join(rootDir, "lib", "language_server", "protocol", "constant.rb"),
    Handlebars.compile(
      `
module LanguageServer
  module Protocol
    module Constant
{{#each names}}
      autoload :{{this}}, "language_server/protocol/constant/{{snake this}}"
{{/each}}

{{#each names}}
      require_relative "constant/{{snake this}}"
{{/each}}
    end
  end
end
`.slice(1),
      { noEscape: true }
    )({ names: modules.map((i) => i.module.name).sort() })
  );
})();
