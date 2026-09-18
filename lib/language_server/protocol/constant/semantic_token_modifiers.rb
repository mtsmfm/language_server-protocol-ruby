module LanguageServer
  module Protocol
    module Constant
      #
      # A set of predefined token modifiers. This set is not fixed
      # an clients can specify additional token types via the
      # corresponding client capabilities.
      #
      # @since 3.16.0
      #
      module SemanticTokenModifiers
        DECLARATION = "declaration"
        DEFINITION = "definition"
        READONLY = "readonly"
        STATIC = "static"
        DEPRECATED = "deprecated"
        ABSTRACT = "abstract"
        ASYNC = "async"
        MODIFICATION = "modification"
        DOCUMENTATION = "documentation"
        DEFAULT_LIBRARY = "defaultLibrary"
      end
    end
  end
end
