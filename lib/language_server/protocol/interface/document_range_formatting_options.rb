module LanguageServer
  module Protocol
    module Interface
      #
      # Provider options for a {@link DocumentRangeFormattingRequest}.
      #
      class DocumentRangeFormattingOptions
        def initialize(ranges_support: nil, work_done_progress: nil)
          @attributes = {}

          @attributes[:rangesSupport] = ranges_support unless ranges_support.nil?
          @attributes[:workDoneProgress] = work_done_progress unless work_done_progress.nil?

          @attributes.freeze
        end

        #
        # Whether the server supports formatting multiple ranges at once.
        #
        # @since 3.18.0
        #
        # @return [boolean]
        def ranges_support
          attributes.fetch(:rangesSupport)
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
