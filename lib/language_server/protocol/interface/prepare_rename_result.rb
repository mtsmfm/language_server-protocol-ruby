module LanguageServer
  module Protocol
    module Interface
      class PrepareRenameResult
        def initialize(start: nil, end: nil, range: nil, placeholder: nil, default_behavior: nil)
          @attributes = {}

          @attributes[:start] = start unless start.nil?
          @attributes[:end] = binding.local_variable_get(:end) unless binding.local_variable_get(:end).nil?
          @attributes[:range] = range unless range.nil?
          @attributes[:placeholder] = placeholder unless placeholder.nil?
          @attributes[:defaultBehavior] = default_behavior unless default_behavior.nil?

          @attributes.freeze
        end

        #
        # The range's start position.
        #
        # @return [Position]
        def start
          attributes.fetch(:start)
        end

        #
        # The range's end position.
        #
        # @return [Position]
        def end
          attributes.fetch(:end)
        end

        #

        #
        # @return [Range]
        def range
          attributes.fetch(:range)
        end

        #

        #
        # @return [string]
        def placeholder
          attributes.fetch(:placeholder)
        end

        #

        #
        # @return [boolean]
        def default_behavior
          attributes.fetch(:defaultBehavior)
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
