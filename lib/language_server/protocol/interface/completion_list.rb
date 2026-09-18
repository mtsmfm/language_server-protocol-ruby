module LanguageServer
  module Protocol
    module Interface
      #
      # Represents a collection of {@link CompletionItem completion items} to be presented
      # in the editor.
      #
      class CompletionList
        def initialize(is_incomplete:, item_defaults: nil, apply_kind: nil, items:)
          @attributes = {}

          @attributes[:isIncomplete] = is_incomplete
          @attributes[:itemDefaults] = item_defaults unless item_defaults.nil?
          @attributes[:applyKind] = apply_kind unless apply_kind.nil?
          @attributes[:items] = items

          @attributes.freeze
        end

        #
        # This list it not complete. Further typing results in recomputing this list.
        #
        # Recomputed lists have all their items replaced (not appended) in the
        # incomplete completion sessions.
        #
        # @return [boolean]
        def is_incomplete
          attributes.fetch(:isIncomplete)
        end

        #
        # In many cases the items of an actual completion result share the same
        # value for properties like `commitCharacters` or the range of a text
        # edit. A completion list can therefore define item defaults which will
        # be used if a completion item itself doesn't specify the value.
        #
        # If a completion list specifies a default value and a completion item
        # also specifies a corresponding value, the rules for combining these are
        # defined by `applyKinds` (if the client supports it), defaulting to
        # ApplyKind.Replace.
        #
        # Servers are only allowed to return default values if the client
        # signals support for this via the `completionList.itemDefaults`
        # capability.
        #
        # @since 3.17.0
        #
        # @return [CompletionItemDefaults]
        def item_defaults
          attributes.fetch(:itemDefaults)
        end

        #
        # Specifies how fields from a completion item should be combined with those
        # from `completionList.itemDefaults`.
        #
        # If unspecified, all fields will be treated as ApplyKind.Replace.
        #
        # If a field's value is ApplyKind.Replace, the value from a completion item
        # (if provided and not `null`) will always be used instead of the value
        # from `completionItem.itemDefaults`.
        #
        # If a field's value is ApplyKind.Merge, the values will be merged using
        # the rules defined against each field below.
        #
        # Servers are only allowed to return `applyKind` if the client
        # signals support for this via the `completionList.applyKindSupport`
        # capability.
        #
        # @since 3.18.0
        #
        # @return [CompletionItemApplyKinds]
        def apply_kind
          attributes.fetch(:applyKind)
        end

        #
        # The completion items.
        #
        # @return [CompletionItem[]]
        def items
          attributes.fetch(:items)
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
