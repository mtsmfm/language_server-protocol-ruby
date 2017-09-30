module LanguageServer
  module Protocol
    module Interface
      #
      # Represents the signature of something callable. A signature
      # can have a label, like a function-name, a doc-comment, and
      # a set of parameters.
      #
      class SignatureInformation < Base
        #
        # The label of this signature. Will be shown in
        # the UI.
        #
        # @return [string]
        define_attribute_method :label

        #
        # The human-readable doc-comment of this signature. Will be shown
        # in the UI but can be omitted.
        #
        # @return [string]
        define_attribute_method :documentation

        #
        # The parameters of this signature.
        #
        # @return [ParameterInformation[]]
        define_attribute_method :parameters

        def initialize(label:, documentation: nil, parameters: nil)
          super
        end
      end
    end
  end
end
