module LanguageServer
  module Protocol
    module Interface
      #
      # Signature help represents the signature of something
      # callable. There can be multiple signature but only one
      # active and only one active parameter.
      #
      class SignatureHelp < Base
        define_attribute_methods(:signature, :active_signature, :active_parameter)

        def initialize(signature:, active_signature: nil, active_parameter: nil)
          super
        end
      end
    end
  end
end
