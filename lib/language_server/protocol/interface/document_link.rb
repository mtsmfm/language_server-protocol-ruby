module LanguageServer
  module Protocol
    module Interface
      #
      # A document link is a range in a text document that links to an internal or external resource, like another
      # text document or a web site.
      #
      class DocumentLink < Base
        define_attribute_methods(:range, :target)

        def initialize(range:, target: nil)
          super
        end
      end
    end
  end
end
