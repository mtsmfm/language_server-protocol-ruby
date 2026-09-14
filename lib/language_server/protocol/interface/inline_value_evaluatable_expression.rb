module LanguageServer
  module Protocol
    module Interface
      #
      # To compute an inline value through an expression evaluation.
      #
      # If only a range is specified, the expression should be
      # extracted from the underlying document.
      #
      # An optional expression could be evaluated instead of
      # the extracted expression.
      #
      # @since 3.17.0
      #
      class InlineValueEvaluatableExpression
        def initialize(range:, expression: nil)
          @attributes = {}

          @attributes[:range] = range
          @attributes[:expression] = expression if expression

          @attributes.freeze
        end

        #
        # The document range for which the inline value applies.
        #
        # The range could be used to extract the evaluatable expression
        # from the underlying document.
        #
        # @return [Range]
        def range
          attributes.fetch(:range)
        end

        #
        # If specified the expression could be evaluated instead.
        #
        # @return [string]
        def expression
          attributes.fetch(:expression)
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
