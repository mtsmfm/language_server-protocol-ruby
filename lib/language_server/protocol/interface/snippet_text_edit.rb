module LanguageServer
  module Protocol
    module Interface
      #
      # An interactive text edit.
      #
      # @since 3.18.0
      #
      class SnippetTextEdit
        def initialize(range:, snippet:, annotation_id: nil)
          @attributes = {}

          @attributes[:range] = range
          @attributes[:snippet] = snippet
          @attributes[:annotationId] = annotation_id unless annotation_id.nil?

          @attributes.freeze
        end

        #
        # The range of the text document to be manipulated.
        #
        # @return [Range]
        def range
          attributes.fetch(:range)
        end

        #
        # The snippet to be inserted.
        #
        # @return [StringValue]
        def snippet
          attributes.fetch(:snippet)
        end

        #
        # The actual identifier of the snippet edit.
        #
        # @return [ChangeAnnotationIdentifier]
        def annotation_id
          attributes.fetch(:annotationId)
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
