module LanguageServer
  module Protocol
    module Interface
      #
      # Provider options for a {@link RenameRequest}.
      #
      class RenameOptions
        def initialize(prepare_provider: nil, work_done_progress: nil)
          @attributes = {}

          @attributes[:prepareProvider] = prepare_provider unless prepare_provider.nil?
          @attributes[:workDoneProgress] = work_done_progress unless work_done_progress.nil?

          @attributes.freeze
        end

        #
        # Renames should be checked and tested before being executed.
        #
        # @since version 3.12.0
        #
        # @return [boolean]
        def prepare_provider
          attributes.fetch(:prepareProvider)
        end

        # @return [boolean]
        def work_done_progress
          attributes.fetch(:workDoneProgress)
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
