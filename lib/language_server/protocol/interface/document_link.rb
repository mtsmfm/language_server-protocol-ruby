module LanguageServer
  module Protocol
    module Interface
      #
      # A document link is a range in a text document that links to an internal or external resource, like another
      # text document or a web site.
      #
      class DocumentLink < Base
        attr_required_keys :range
        attr_optional_keys :target
      end
    end
  end
end
