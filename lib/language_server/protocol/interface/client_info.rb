module LanguageServer
  module Protocol
    module Interface
      #
      # Information about the client
      #
      # @since 3.15.0
      # @since 3.18.0 ClientInfo type name added.
      #
      class ClientInfo
        def initialize(name:, version: nil)
          @attributes = {}

          @attributes[:name] = name
          @attributes[:version] = version if version

          @attributes.freeze
        end

        #
        # The name of the client as defined by the client.
        #
        # @return [string]
        def name
          attributes.fetch(:name)
        end

        #
        # The client's version as defined by the client.
        #
        # @return [string]
        def version
          attributes.fetch(:version)
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
