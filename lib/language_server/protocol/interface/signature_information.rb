module LanguageServer
  module Protocol
    module Interface
      #
      # Represents the signature of something callable. A signature
      # can have a label, like a function-name, a doc-comment, and
      # a set of parameters.
      #
      class SignatureInformation < Base
        attr_required_keys :label
        attr_optional_keys :documentation, :parameters
      end
    end
  end
end
