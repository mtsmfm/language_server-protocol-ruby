module LanguageServer
  module Protocol
    module Interface
      class CompletionItem < Base
        define_attribute_methods(:label, :kind, :detail, :documentation, :sort_text, :filter_text, :insert_text, :insert_text_format, :text_edit, :additional_text_edits, :command, :data)

        def initialize(label:, kind: nil, detail: nil, documentation: nil, sort_text: nil, filter_text: nil, insert_text: nil, insert_text_format: nil, text_edit: nil, additional_text_edits: nil, command: nil, data: nil)
          super
        end
      end
    end
  end
end
