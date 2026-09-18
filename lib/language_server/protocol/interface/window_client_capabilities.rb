module LanguageServer
  module Protocol
    module Interface
      class WindowClientCapabilities
        def initialize(work_done_progress: nil, show_message: nil, show_document: nil)
          @attributes = {}

          @attributes[:workDoneProgress] = work_done_progress unless work_done_progress.nil?
          @attributes[:showMessage] = show_message unless show_message.nil?
          @attributes[:showDocument] = show_document unless show_document.nil?

          @attributes.freeze
        end

        #
        # It indicates whether the client supports server initiated
        # progress using the `window/workDoneProgress/create` request.
        #
        # The capability also controls Whether client supports handling
        # of progress notifications. If set servers are allowed to report a
        # `workDoneProgress` property in the request specific server
        # capabilities.
        #
        # @since 3.15.0
        #
        # @return [boolean]
        def work_done_progress
          attributes.fetch(:workDoneProgress)
        end

        #
        # Capabilities specific to the showMessage request.
        #
        # @since 3.16.0
        #
        # @return [ShowMessageRequestClientCapabilities]
        def show_message
          attributes.fetch(:showMessage)
        end

        #
        # Capabilities specific to the showDocument request.
        #
        # @since 3.16.0
        #
        # @return [ShowDocumentClientCapabilities]
        def show_document
          attributes.fetch(:showDocument)
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
