module LanguageServer
  module Protocol
    module Interface
      #
      # @since 3.18.0
      #
      class ServerCompletionItemOptions
        def initialize(label_details_support: nil)
          @attributes = {}

          @attributes[:labelDetailsSupport] = label_details_support if label_details_support

          @attributes.freeze
        end

        #
        # The server has support for completion item label
        # details (see also `CompletionItemLabelDetails`) when
        # receiving a completion item in a resolve call.
        #
        # @since 3.17.0
        #
        # @return [boolean]
        def label_details_support
          attributes.fetch(:labelDetailsSupport)
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
