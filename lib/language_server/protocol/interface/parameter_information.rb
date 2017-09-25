module LanguageServer
  module Protocol
    module Interface
      #
      # Represents a parameter of a callable-signature. A parameter can
      # have a label and a doc-comment.
      #
      class ParameterInformation < Base
        attr_required_keys :label
        attr_optional_keys :documentation
      end
    end
  end
end
