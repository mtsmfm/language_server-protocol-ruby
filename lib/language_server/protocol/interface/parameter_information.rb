module LanguageServer
  module Protocol
    module Interface
      #
      # Represents a parameter of a callable-signature. A parameter can
      # have a label and a doc-comment.
      #
      class ParameterInformation < Base
        #
        # The label of this parameter. Will be shown in
        # the UI.
        #
        # @return [string]
        define_attribute_method :label

        #
        # The human-readable doc-comment of this parameter. Will be shown
        # in the UI but can be omitted.
        #
        # @return [string]
        define_attribute_method :documentation

        def initialize(label:, documentation: nil)
          super
        end
      end
    end
  end
end
