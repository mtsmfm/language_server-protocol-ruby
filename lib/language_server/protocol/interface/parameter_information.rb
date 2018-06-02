module LanguageServer
  module Protocol
    module Interface
      #
      # Represents a parameter of a callable-signature. A parameter can
      # have a label and a doc-comment.
      #
      class ParameterInformation
        def initialize(label:, documentation: nil)
          @attributes = {}

          @attributes[:label] = label
          @attributes[:documentation] = documentation if documentation

          @attributes.freeze
        end

        #
        # The label of this parameter. Will be shown in
        # the UI.
        #
        # @return [string]
        def label
          attributes.fetch(:label)
        end

        #
        # The human-readable doc-comment of this parameter. Will be shown
        # in the UI but can be omitted.
        #
        # @return [string | MarkupContent]
        def documentation
          attributes.fetch(:documentation)
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
