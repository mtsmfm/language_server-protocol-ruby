module LanguageServer
  module Protocol
    module Interface
      #
      # Edit range variant that includes ranges for insert and replace operations.
      #
      # @since 3.18.0
      #
      class EditRangeWithInsertReplace
        def initialize(insert:, replace:)
          @attributes = {}

          @attributes[:insert] = insert
          @attributes[:replace] = replace

          @attributes.freeze
        end

        # @return [Range]
        def insert
          attributes.fetch(:insert)
        end

        # @return [Range]
        def replace
          attributes.fetch(:replace)
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
