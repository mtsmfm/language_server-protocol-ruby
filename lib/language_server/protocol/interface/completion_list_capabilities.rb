module LanguageServer
  module Protocol
    module Interface
      #
      # The client supports the following `CompletionList` specific
      # capabilities.
      #
      # @since 3.17.0
      #
      class CompletionListCapabilities
        def initialize(item_defaults: nil, apply_kind_support: nil)
          @attributes = {}

          @attributes[:itemDefaults] = item_defaults unless item_defaults.nil?
          @attributes[:applyKindSupport] = apply_kind_support unless apply_kind_support.nil?

          @attributes.freeze
        end

        #
        # The client supports the following itemDefaults on
        # a completion list.
        #
        # The value lists the supported property names of the
        # `CompletionList.itemDefaults` object. If omitted
        # no properties are supported.
        #
        # @since 3.17.0
        #
        # @return [string[]]
        def item_defaults
          attributes.fetch(:itemDefaults)
        end

        #
        # Specifies whether the client supports `CompletionList.applyKind` to
        # indicate how supported values from `completionList.itemDefaults`
        # and `completion` will be combined.
        #
        # If a client supports `applyKind` it must support it for all fields
        # that it supports that are listed in `CompletionList.applyKind`. This
        # means when clients add support for new/future fields in completion
        # items the MUST also support merge for them if those fields are
        # defined in `CompletionList.applyKind`.
        #
        # @since 3.18.0
        #
        # @return [boolean]
        def apply_kind_support
          attributes.fetch(:applyKindSupport)
        end

        attr_reader :attributes

        def to_hash
          attributes
        end

        def to_json(*args)
          to_hash.to_json(*args)
        end
      end
    end
  end
end
