module LanguageServer
  module Protocol
    module Interface
      class CompletionClientCapabilities
        def initialize(dynamic_registration: nil, completion_item: nil, completion_item_kind: nil, context_support: nil)
          @attributes = {}

          @attributes[:dynamicRegistration] = dynamic_registration if dynamic_registration
          @attributes[:completionItem] = completion_item if completion_item
          @attributes[:completionItemKind] = completion_item_kind if completion_item_kind
          @attributes[:contextSupport] = context_support if context_support

          @attributes.freeze
        end

        #
        # Whether completion supports dynamic registration.
        #
        # @return [boolean]
        def dynamic_registration
          attributes.fetch(:dynamicRegistration)
        end

        #
        # The client supports the following `CompletionItem` specific
        # capabilities.
        #
        # @return [{ snippetSupport?: boolean; commitCharactersSupport?: boolean; documentationFormat?: MarkupKind[]; deprecatedSupport?: boolean; preselectSupport?: boolean; tagSupport?: { valueSet: 1[]; }; insertReplaceSupport?: boolean; resolveSupport?: { ...; }; insertTextModeSupport?: { ...; }; }]
        def completion_item
          attributes.fetch(:completionItem)
        end

        # @return [{ valueSet?: any[]; }]
        def completion_item_kind
          attributes.fetch(:completionItemKind)
        end

        #
        # The client supports to send additional context information for a
        # `textDocument/completion` request.
        #
        # @return [boolean]
        def context_support
          attributes.fetch(:contextSupport)
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
