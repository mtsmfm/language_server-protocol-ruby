module LanguageServer
  module Protocol
    module Interface
      #
      # Signature help represents the signature of something
      # callable. There can be multiple signature but only one
      # active and only one active parameter.
      #
      class SignatureHelp < Base
        #
        # One or more signatures.
        #
        # @return [SignatureInformation[]]
        define_attribute_method :signatures

        #
        # The active signature. If omitted or the value lies outside the
        # range of `signatures` the value defaults to zero or is ignored if
        # `signatures.length === 0`. Whenever possible implementors should
        # make an active decision about the active signature and shouldn't
        # rely on a default value.
        # In future version of the protocol this property might become
        # mandantory to better express this.
        #
        # @return [number]
        define_attribute_method :active_signature

        #
        # The active parameter of the active signature. If omitted or the value
        # lies outside the range of `signatures[activeSignature].parameters`
        # defaults to 0 if the active signature has parameters. If
        # the active signature has no parameters it is ignored.
        # In future version of the protocol this property might become
        # mandantory to better express the active parameter if the
        # active signature does have any.
        #
        # @return [number]
        define_attribute_method :active_parameter

        def initialize(signatures:, active_signature: nil, active_parameter: nil)
          super
        end
      end
    end
  end
end
