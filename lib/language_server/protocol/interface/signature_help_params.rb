module LanguageServer
  module Protocol
    module Interface
      class SignatureHelpParams < WorkDoneProgressParams
        def initialize(work_done_token: nil, context: nil)
          @attributes = {}

          @attributes[:workDoneToken] = work_done_token if work_done_token
          @attributes[:context] = context if context

          @attributes.freeze
        end

        #
        # The signature help context. This is only available if the client
        # specifies to send this using the client capability
        # `textDocument.signatureHelp.contextSupport === true`
        #
        # @return [SignatureHelpContext]
        def context
          attributes.fetch(:context)
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
