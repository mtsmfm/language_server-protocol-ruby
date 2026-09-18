module LanguageServer
  module Protocol
    module Interface
      #
      # Information about the server
      #
      # @since 3.15.0
      # @since 3.18.0 ServerInfo type name added.
      #
      class ServerInfo
        def initialize(name:, version: nil)
          @attributes = {}

          @attributes[:name] = name
          @attributes[:version] = version unless version.nil?

          @attributes.freeze
        end

        #
        # The name of the server as defined by the server.
        #
        # @return [string]
        def name
          attributes.fetch(:name)
        end

        #
        # The server's version as defined by the server.
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
