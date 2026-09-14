module LanguageServer
  module Protocol
    module Interface
      #
      # @since 3.18.0
      #
      class ClientCompletionItemOptions
        def initialize(snippet_support: nil, commit_characters_support: nil, documentation_format: nil, deprecated_support: nil, preselect_support: nil, tag_support: nil, insert_replace_support: nil, resolve_support: nil, insert_text_mode_support: nil, label_details_support: nil)
          @attributes = {}

          @attributes[:snippetSupport] = snippet_support if snippet_support
          @attributes[:commitCharactersSupport] = commit_characters_support if commit_characters_support
          @attributes[:documentationFormat] = documentation_format if documentation_format
          @attributes[:deprecatedSupport] = deprecated_support if deprecated_support
          @attributes[:preselectSupport] = preselect_support if preselect_support
          @attributes[:tagSupport] = tag_support if tag_support
          @attributes[:insertReplaceSupport] = insert_replace_support if insert_replace_support
          @attributes[:resolveSupport] = resolve_support if resolve_support
          @attributes[:insertTextModeSupport] = insert_text_mode_support if insert_text_mode_support
          @attributes[:labelDetailsSupport] = label_details_support if label_details_support

          @attributes.freeze
        end

        #
        # Client supports snippets as insert text.
        #
        # A snippet can define tab stops and placeholders with `$1`, `$2`
        # and `${3:foo}`. `$0` defines the final tab stop, it defaults to
        # the end of the snippet. Placeholders with equal identifiers are linked,
        # that is typing in one will update others too.
        #
        # @return [boolean]
        def snippet_support
          attributes.fetch(:snippetSupport)
        end

        #
        # Client supports commit characters on a completion item.
        #
        # @return [boolean]
        def commit_characters_support
          attributes.fetch(:commitCharactersSupport)
        end

        #
        # Client supports the following content formats for the documentation
        # property. The order describes the preferred format of the client.
        #
        # @return [MarkupKind[]]
        def documentation_format
          attributes.fetch(:documentationFormat)
        end

        #
        # Client supports the deprecated property on a completion item.
        #
        # @return [boolean]
        def deprecated_support
          attributes.fetch(:deprecatedSupport)
        end

        #
        # Client supports the preselect property on a completion item.
        #
        # @return [boolean]
        def preselect_support
          attributes.fetch(:preselectSupport)
        end

        #
        # Client supports the tag property on a completion item. Clients supporting
        # tags have to handle unknown tags gracefully. Clients especially need to
        # preserve unknown tags when sending a completion item back to the server in
        # a resolve call.
        #
        # @since 3.15.0
        #
        # @return [CompletionItemTagOptions]
        def tag_support
          attributes.fetch(:tagSupport)
        end

        #
        # Client support insert replace edit to control different behavior if a
        # completion item is inserted in the text or should replace text.
        #
        # @since 3.16.0
        #
        # @return [boolean]
        def insert_replace_support
          attributes.fetch(:insertReplaceSupport)
        end

        #
        # Indicates which properties a client can resolve lazily on a completion
        # item. Before version 3.16.0 only the predefined properties `documentation`
        # and `details` could be resolved lazily.
        #
        # @since 3.16.0
        #
        # @return [ClientCompletionItemResolveOptions]
        def resolve_support
          attributes.fetch(:resolveSupport)
        end

        #
        # The client supports the `insertTextMode` property on
        # a completion item to override the whitespace handling mode
        # as defined by the client (see `insertTextMode`).
        #
        # @since 3.16.0
        #
        # @return [ClientCompletionItemInsertTextModeOptions]
        def insert_text_mode_support
          attributes.fetch(:insertTextModeSupport)
        end

        #
        # The client has support for completion item label
        # details (see also `CompletionItemLabelDetails`).
        #
        # @since 3.17.0
        #
        # @return [boolean]
        def label_details_support
          attributes.fetch(:labelDetailsSupport)
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
