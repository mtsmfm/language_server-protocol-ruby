module LanguageServer
  module Protocol
    module Interface
      #
      # Inline value information can be provided by different means:
      # - directly as a text value (class InlineValueText).
      # - as a name to use for a variable lookup (class InlineValueVariableLookup)
      # - as an evaluatable expression (class InlineValueEvaluatableExpression)
      # The InlineValue types combines all inline value types into one type.
      #
      # @since 3.17.0
      #
      class InlineValue
        def initialize(range:, text: nil, variable_name: nil, case_sensitive_lookup: nil, expression: nil)
          @attributes = {}

          @attributes[:range] = range
          @attributes[:text] = text unless text.nil?
          @attributes[:variableName] = variable_name unless variable_name.nil?
          @attributes[:caseSensitiveLookup] = case_sensitive_lookup unless case_sensitive_lookup.nil?
          @attributes[:expression] = expression unless expression.nil?

          @attributes.freeze
        end

        #
        # The document range for which the inline value applies.
        #
        # --- OR ---
        #
        # The document range for which the inline value applies.
        #
        # The range could be used to extract the variable name
        # from the underlying document.
        #
        # --- OR ---
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
        # The text of the inline value.
        #
        # @return [string]
        def text
          attributes.fetch(:text)
        end

        #
        # If specified the name of the variable to look up.
        #
        # @return [string]
        def variable_name
          attributes.fetch(:variableName)
        end

        #
        # How to perform the lookup.
        #
        # @return [boolean]
        def case_sensitive_lookup
          attributes.fetch(:caseSensitiveLookup)
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
