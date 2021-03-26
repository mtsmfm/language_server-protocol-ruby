module LanguageServer
  module Protocol
    module Interface
      class CallHierarchyRegistrationOptions < StaticRegistrationOptions
        def initialize(id: nil)
          @attributes = {}

          @attributes[:id] = id if id

          @attributes.freeze
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
