module LanguageServer
  module Protocol
    module Constant
      #
      # Defines whether the insert text in a completion item should be interpreted as
      # plain text or a snippet.
      #
      module InsertTextFormat
        #
        # The primary text to be inserted is treated as a plain string.
        #
        PLAIN_TEXT = 1
        #
        # The primary text to be inserted is treated as a snippet.
        #
        # A snippet can define tab stops and placeholders with `$1`, `$2`
        # and `${3:foo}`. `$0` defines the final tab stop, it defaults to
        # the end of the snippet. Placeholders with equal identifiers are linked,
        # that is typing in one will update others too.
        #
        # See also: https://microsoft.github.io/language-server-protocol/specifications/specification-current/#snippet_syntax
        #
        SNIPPET = 2
      end
    end
  end
end
