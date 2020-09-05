module LanguageServer
  module Protocol
    module Interface
      class RenameOptions < WorkDoneProgressOptions
        def initialize(work_done_progress: nil, prepare_provider: nil)
          @attributes = {}

          @attributes[:workDoneProgress] = work_done_progress if work_done_progress
          @attributes[:prepareProvider] = prepare_provider if prepare_provider

          @attributes.freeze
        end

        #
        # Renames should be checked and tested before being executed.
        #
        # @return [boolean]
        def prepare_provider
          attributes.fetch(:prepareProvider)
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
