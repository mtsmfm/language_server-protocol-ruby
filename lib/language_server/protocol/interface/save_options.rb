module LanguageServer
  module Protocol
    module Interface
      #
      # Save options.
      #
      class SaveOptions < Base
        #
        # The client is supposed to include the content on save.
        #
        # @return [boolean]
        define_attribute_method :include_text

        def initialize(include_text: nil)
          super
        end
      end
    end
  end
end
