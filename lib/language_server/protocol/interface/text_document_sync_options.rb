module LanguageServer
  module Protocol
    module Interface
      class TextDocumentSyncOptions
        def initialize(open_close: nil, change: nil, will_save: nil, will_save_wait_until: nil, save: nil)
          @attributes = {}

          @attributes[:openClose] = open_close if open_close
          @attributes[:change] = change if change
          @attributes[:willSave] = will_save if will_save
          @attributes[:willSaveWaitUntil] = will_save_wait_until if will_save_wait_until
          @attributes[:save] = save if save

          @attributes.freeze
        end

        #
        # Open and close notifications are sent to the server.
        #
        # @return [boolean]
        def open_close
          attributes.fetch(:openClose)
        end

        #
        # Change notifications are sent to the server. See TextDocumentSyncKind.None, TextDocumentSyncKind.Full
        # and TextDocumentSyncKind.Incremental. If omitted it defaults to TextDocumentSyncKind.None.
        #
        # @return [number]
        def change
          attributes.fetch(:change)
        end

        #
        # Will save notifications are sent to the server.
        #
        # @return [boolean]
        def will_save
          attributes.fetch(:willSave)
        end

        #
        # Will save wait until requests are sent to the server.
        #
        # @return [boolean]
        def will_save_wait_until
          attributes.fetch(:willSaveWaitUntil)
        end

        #
        # Save notifications are sent to the server.
        #
        # @return [SaveOptions]
        def save
          attributes.fetch(:save)
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
