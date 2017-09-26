module LanguageServer
  module Protocol
    module Interface
      #
      # A document link is a range in a text document that links to an internal or external resource, like another
      # text document or a web site.
      #
      class DocumentLink < Base
        #
        # The range this link applies to.
        #
        # @return [Range]
        define_attribute_method :range

        #
        # The uri this link points to. If missing a resolve request is sent later.
        #
        # @return [string]
        define_attribute_method :target

        def initialize(range:, target: nil)
          super
        end
      end
    end
  end
end
