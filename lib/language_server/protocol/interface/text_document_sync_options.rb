module LanguageServer
  module Protocol
    module Interface
      class TextDocumentSyncOptions < Base
        #
        # Open and close notifications are sent to the server.
        #
        # @return [boolean]
        define_attribute_method :open_close

        #
        # Change notificatins are sent to the server. See TextDocumentSyncKind.None, TextDocumentSyncKind.Full
        # and TextDocumentSyncKindIncremental.
        #
        # @return [number]
        define_attribute_method :change

        #
        # Will save notifications are sent to the server.
        #
        # @return [boolean]
        define_attribute_method :will_save

        #
        # Will save wait until requests are sent to the server.
        #
        # @return [boolean]
        define_attribute_method :will_save_wait_until

        #
        # Save notifications are sent to the server.
        #
        # @return [SaveOptions]
        define_attribute_method :save

        def initialize(open_close: nil, change: nil, will_save: nil, will_save_wait_until: nil, save: nil)
          super
        end
      end
    end
  end
end
