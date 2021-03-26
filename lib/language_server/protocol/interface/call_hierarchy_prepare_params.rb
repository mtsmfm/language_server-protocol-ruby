module LanguageServer
  module Protocol
    module Interface
      class CallHierarchyPrepareParams < WorkDoneProgressParams
        def initialize(work_done_token: nil)
          @attributes = {}

          @attributes[:workDoneToken] = work_done_token if work_done_token

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
