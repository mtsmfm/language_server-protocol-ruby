module LanguageServer
  module Protocol
    module Interface
      class RenameParams < WorkDoneProgressParams
        def initialize(work_done_token: nil, new_name:)
          @attributes = {}

          @attributes[:workDoneToken] = work_done_token if work_done_token
          @attributes[:newName] = new_name

          @attributes.freeze
        end

        #
        # The new name of the symbol. If the given name is not valid the
        # request must return a [ResponseError](#ResponseError) with an
        # appropriate message set.
        #
        # @return [string]
        def new_name
          attributes.fetch(:newName)
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
