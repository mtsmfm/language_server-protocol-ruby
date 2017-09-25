module LanguageServer
  module Protocol
    module Interface
      #
      # Signature help represents the signature of something
      # callable. There can be multiple signature but only one
      # active and only one active parameter.
      #
      class SignatureHelp < Base
        attr_required_keys :signature
        attr_optional_keys :active_signature, :active_parameter
      end
    end
  end
end
