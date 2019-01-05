module LanguageServer
  module Protocol
    module Interface
      #
      # Create file operation
      #
      class CreateFile
        def initialize(kind:, uri:, options: nil)
          @attributes = {}

          @attributes[:kind] = kind
          @attributes[:uri] = uri
          @attributes[:options] = options if options

          @attributes.freeze
        end

        #
        # A create
        #
        # @return ["create"]
        def kind
          attributes.fetch(:kind)
        end

        #
        # The resource to create.
        #
        # @return [string]
        def uri
          attributes.fetch(:uri)
        end

        #
        # Additional options
        #
        # @return [CreateFileOptions]
        def options
          attributes.fetch(:options)
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
