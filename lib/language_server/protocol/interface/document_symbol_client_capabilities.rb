module LanguageServer
  module Protocol
    module Interface
      #
      # Client Capabilities for a {@link DocumentSymbolRequest}.
      #
      class DocumentSymbolClientCapabilities
        def initialize(dynamic_registration: nil, symbol_kind: nil, hierarchical_document_symbol_support: nil, tag_support: nil, label_support: nil)
          @attributes = {}

          @attributes[:dynamicRegistration] = dynamic_registration unless dynamic_registration.nil?
          @attributes[:symbolKind] = symbol_kind unless symbol_kind.nil?
          @attributes[:hierarchicalDocumentSymbolSupport] = hierarchical_document_symbol_support unless hierarchical_document_symbol_support.nil?
          @attributes[:tagSupport] = tag_support unless tag_support.nil?
          @attributes[:labelSupport] = label_support unless label_support.nil?

          @attributes.freeze
        end

        #
        # Whether document symbol supports dynamic registration.
        #
        # @return [boolean]
        def dynamic_registration
          attributes.fetch(:dynamicRegistration)
        end

        #
        # Specific capabilities for the `SymbolKind` in the
        # `textDocument/documentSymbol` request.
        #
        # @return [ClientSymbolKindOptions]
        def symbol_kind
          attributes.fetch(:symbolKind)
        end

        #
        # The client supports hierarchical document symbols.
        #
        # @return [boolean]
        def hierarchical_document_symbol_support
          attributes.fetch(:hierarchicalDocumentSymbolSupport)
        end

        #
        # The client supports tags on `SymbolInformation`. Tags are supported on
        # `DocumentSymbol` if `hierarchicalDocumentSymbolSupport` is set to true.
        # Clients supporting tags have to handle unknown tags gracefully.
        #
        # @since 3.16.0
        #
        # @return [ClientSymbolTagOptions]
        def tag_support
          attributes.fetch(:tagSupport)
        end

        #
        # The client supports an additional label presented in the UI when
        # registering a document symbol provider.
        #
        # @since 3.16.0
        #
        # @return [boolean]
        def label_support
          attributes.fetch(:labelSupport)
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
