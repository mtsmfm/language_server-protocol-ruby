module LanguageServer
  module Protocol
    module Interface
      #
      # @since 3.18.0
      #
      class StaleRequestSupportOptions
        def initialize(cancel:, retry_on_content_modified:)
          @attributes = {}

          @attributes[:cancel] = cancel
          @attributes[:retryOnContentModified] = retry_on_content_modified

          @attributes.freeze
        end

        #
        # The client will actively cancel the request.
        #
        # @return [boolean]
        def cancel
          attributes.fetch(:cancel)
        end

        #
        # The list of requests for which the client
        # will retry the request if it receives a
        # response with error code `ContentModified`
        #
        # @return [string[]]
        def retry_on_content_modified
          attributes.fetch(:retryOnContentModified)
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
