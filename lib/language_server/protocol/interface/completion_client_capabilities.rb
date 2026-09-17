module LanguageServer
  module Protocol
    module Interface
      #
      # Completion client capabilities
      #
      class CompletionClientCapabilities
        def initialize(dynamic_registration: nil, completion_item: nil, completion_item_kind: nil, insert_text_mode: nil, context_support: nil, completion_list: nil)
          @attributes = {}

          @attributes[:dynamicRegistration] = dynamic_registration unless dynamic_registration.nil?
          @attributes[:completionItem] = completion_item unless completion_item.nil?
          @attributes[:completionItemKind] = completion_item_kind unless completion_item_kind.nil?
          @attributes[:insertTextMode] = insert_text_mode unless insert_text_mode.nil?
          @attributes[:contextSupport] = context_support unless context_support.nil?
          @attributes[:completionList] = completion_list unless completion_list.nil?

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
        # @return [ClientCompletionItemOptions]
        def completion_item
          attributes.fetch(:completionItem)
        end

        #
        # The client supports the following completion item kinds.
        #
        # @return [ClientCompletionItemOptionsKind]
        def completion_item_kind
          attributes.fetch(:completionItemKind)
        end

        #
        # Defines how the client handles whitespace and indentation
        # when accepting a completion item that uses multi line
        # text in either `insertText` or `textEdit`.
        #
        # @since 3.17.0
        #
        # @return [InsertTextMode]
        def insert_text_mode
          attributes.fetch(:insertTextMode)
        end

        #
        # The client supports to send additional context information for a
        # `textDocument/completion` request.
        #
        # @return [boolean]
        def context_support
          attributes.fetch(:contextSupport)
        end

        #
        # The client supports the following `CompletionList` specific
        # capabilities.
        #
        # @since 3.17.0
        #
        # @return [CompletionListCapabilities]
        def completion_list
          attributes.fetch(:completionList)
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
