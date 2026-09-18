module LanguageServer
  module Protocol
    module Interface
      #
      # Client capabilities of a {@link DocumentRangeFormattingRequest}.
      #
      class DocumentRangeFormattingClientCapabilities
        def initialize(dynamic_registration: nil, ranges_support: nil)
          @attributes = {}

          @attributes[:dynamicRegistration] = dynamic_registration unless dynamic_registration.nil?
          @attributes[:rangesSupport] = ranges_support unless ranges_support.nil?

          @attributes.freeze
        end

        #
        # Whether range formatting supports dynamic registration.
        #
        # @return [boolean]
        def dynamic_registration
          attributes.fetch(:dynamicRegistration)
        end

        #
        # Whether the client supports formatting multiple ranges at once.
        #
        # @since 3.18.0
        #
        # @return [boolean]
        def ranges_support
          attributes.fetch(:rangesSupport)
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
