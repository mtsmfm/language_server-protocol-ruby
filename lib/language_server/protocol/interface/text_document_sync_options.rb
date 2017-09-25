module LanguageServer
  module Protocol
    module Interface
      class TextDocumentSyncOptions < Base
        define_attribute_methods(:open_close, :change, :will_save, :will_save_wait_until, :save)

        def initialize(open_close: nil, change: nil, will_save: nil, will_save_wait_until: nil, save: nil)
          super
        end
      end
    end
  end
end
