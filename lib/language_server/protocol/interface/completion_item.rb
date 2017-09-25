module LanguageServer
  module Protocol
    module Interface
      class CompletionItem < Base
        attr_required_keys:label
        attr_optional_keys :kind, :detail, :documentation, :sort_text, :filter_text,
          :insert_text, :insert_text_format, :text_edit, :additional_text_edits, :command, :data
      end
    end
  end
end
