module LanguageServer
  module Protocol
    module Interface
      #
      # Represents the signature of something callable. A signature
      # can have a label, like a function-name, a doc-comment, and
      # a set of parameters.
      #
      class SignatureInformation < Base
        define_attribute_methods(:label, :documentation, :parameters)

        def initialize(label:, documentation: nil, parameters: nil)
          super
        end
      end
    end
  end
end
