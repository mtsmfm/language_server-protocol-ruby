module LanguageServer
  module Protocol
    module Interface
      #
      # @since 3.18.0
      #
      class ChangeAnnotationsSupportOptions
        def initialize(groups_on_label: nil)
          @attributes = {}

          @attributes[:groupsOnLabel] = groups_on_label unless groups_on_label.nil?

          @attributes.freeze
        end

        #
        # Whether the client groups edits with equal labels into tree nodes,
        # for instance all edits labelled with "Changes in Strings" would
        # be a tree node.
        #
        # @return [boolean]
        def groups_on_label
          attributes.fetch(:groupsOnLabel)
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
