module LanguageServer
  module Protocol
    module Interface
      #
      # A special text edit with an additional change annotation.
      #
      class AnnotatedTextEdit < TextEdit
        def initialize(range:, new_text:, annotation_id:)
          @attributes = {}

          @attributes[:range] = range
          @attributes[:newText] = new_text
          @attributes[:annotationId] = annotation_id

          @attributes.freeze
        end

        #
        # The actual annotation identifier.
        #
        # @return [string]
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
