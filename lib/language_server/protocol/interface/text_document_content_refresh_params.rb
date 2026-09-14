module LanguageServer
  module Protocol
    module Interface
      #
      # Parameters for the `workspace/textDocumentContent/refresh` request.
      #
      # @since 3.18.0
      #
      class TextDocumentContentRefreshParams
        def initialize(uri:)
          @attributes = {}

          @attributes[:uri] = uri

          @attributes.freeze
        end

        #
        # The uri of the text document to refresh.
        #
        # @return [DocumentUri]
        def uri
          attributes.fetch(:uri)
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
