module LanguageServer
  module Protocol
    module Interface
      class Diagnostic < Base
        #
        # The range at which the message applies.
        #
        # @return [Range]
        define_attribute_method :range

        #
        # The diagnostic's severity. Can be omitted. If omitted it is up to the
        # client to interpret diagnostics as error, warning, info or hint.
        #
        # @return [number]
        define_attribute_method :severity

        #
        # The diagnostic's code. Can be omitted.
        #
        # @return [string | number]
        define_attribute_method :code

        #
        # A human-readable string describing the source of this
        # diagnostic, e.g. 'typescript' or 'super lint'.
        #
        # @return [string]
        define_attribute_method :source

        #
        # The diagnostic's message.
        #
        # @return [string]
        define_attribute_method :message

        def initialize(range:, severity: nil, code: nil, source: nil, message:)
          super
        end
      end
    end
  end
end
