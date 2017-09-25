module LanguageServer
  module Protocol
    module Interface
      #
      # Represents a parameter of a callable-signature. A parameter can
      # have a label and a doc-comment.
      #
      class ParameterInformation < Base
        define_attribute_methods(:label, :documentation)

        def initialize(label:, documentation: nil)
          super
        end
      end
    end
  end
end
