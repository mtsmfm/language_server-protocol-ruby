module LanguageServer
  module Protocol
    module Interface
      class TextDocumentSyncOptions < Base
        attr_optional_keys :open_close, :change, :will_save, :will_save_wait_until, :save
      end
    end
  end
end
