module LanguageServer
  module Protocol
    module Interface
      #
      # In many cases the items of an actual completion result share the same
      # value for properties like `commitCharacters` or the range of a text
      # edit. A completion list can therefore define item defaults which will
      # be used if a completion item itself doesn't specify the value.
      #
      # If a completion list specifies a default value and a completion item
      # also specifies a corresponding value, the rules for combining these are
      # defined by `applyKinds` (if the client supports it), defaulting to
      # ApplyKind.Replace.
      #
      # Servers are only allowed to return default values if the client
      # signals support for this via the `completionList.itemDefaults`
      # capability.
      #
      # @since 3.17.0
      #
      class CompletionItemDefaults
        def initialize(commit_characters: nil, edit_range: nil, insert_text_format: nil, insert_text_mode: nil, data: nil)
          @attributes = {}

          @attributes[:commitCharacters] = commit_characters if commit_characters
          @attributes[:editRange] = edit_range if edit_range
          @attributes[:insertTextFormat] = insert_text_format if insert_text_format
          @attributes[:insertTextMode] = insert_text_mode if insert_text_mode
          @attributes[:data] = data if data

          @attributes.freeze
        end

        #
        # A default commit character set.
        #
        # @since 3.17.0
        #
        # @return [string[]]
        def commit_characters
          attributes.fetch(:commitCharacters)
        end

        #
        # A default edit range.
        #
        # @since 3.17.0
        #
        # @return [Range | EditRangeWithInsertReplace]
        def edit_range
          attributes.fetch(:editRange)
        end

        #
        # A default insert text format.
        #
        # @since 3.17.0
        #
        # @return [InsertTextFormat]
        def insert_text_format
          attributes.fetch(:insertTextFormat)
        end

        #
        # A default insert text mode.
        #
        # @since 3.17.0
        #
        # @return [InsertTextMode]
        def insert_text_mode
          attributes.fetch(:insertTextMode)
        end

        #
        # A default data value.
        #
        # @since 3.17.0
        #
        # @return [LSPAny]
        def data
          attributes.fetch(:data)
        end

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
