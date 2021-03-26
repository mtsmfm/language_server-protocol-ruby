module LanguageServer
  module Protocol
    module Interface
      class DocumentSymbolRegistrationOptions < DocumentSymbolOptions
        def initialize(work_done_progress: nil, label: nil)
          @attributes = {}

          @attributes[:workDoneProgress] = work_done_progress if work_done_progress
          @attributes[:label] = label if label

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
