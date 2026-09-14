module LanguageServer
  module Protocol
    module Interface
      #
      # Specifies how fields from a completion item should be combined with those
      # from `completionList.itemDefaults`.
      #
      # If unspecified, all fields will be treated as ApplyKind.Replace.
      #
      # If a field's value is ApplyKind.Replace, the value from a completion item (if
      # provided and not `null`) will always be used instead of the value from
      # `completionItem.itemDefaults`.
      #
      # If a field's value is ApplyKind.Merge, the values will be merged using the rules
      # defined against each field below.
      #
      # Servers are only allowed to return `applyKind` if the client
      # signals support for this via the `completionList.applyKindSupport`
      # capability.
      #
      # @since 3.18.0
      #
      class CompletionItemApplyKinds
        def initialize(commit_characters: nil, data: nil)
          @attributes = {}

          @attributes[:commitCharacters] = commit_characters if commit_characters
          @attributes[:data] = data if data

          @attributes.freeze
        end

        #
        # Specifies whether commitCharacters on a completion will replace or be
        # merged with those in `completionList.itemDefaults.commitCharacters`.
        #
        # If ApplyKind.Replace, the commit characters from the completion item will
        # always be used unless not provided, in which case those from
        # `completionList.itemDefaults.commitCharacters` will be used. An
        # empty list can be used if a completion item does not have any commit
        # characters and also should not use those from
        # `completionList.itemDefaults.commitCharacters`.
        #
        # If ApplyKind.Merge the commitCharacters for the completion will be the
        # union of all values in both `completionList.itemDefaults.commitCharacters`
        # and the completion's own `commitCharacters`.
        #
        # @since 3.18.0
        #
        # @return [ApplyKind]
        def commit_characters
          attributes.fetch(:commitCharacters)
        end

        #
        # Specifies whether the `data` field on a completion will replace or
        # be merged with data from `completionList.itemDefaults.data`.
        #
        # If ApplyKind.Replace, the data from the completion item will be used if
        # provided (and not `null`), otherwise
        # `completionList.itemDefaults.data` will be used. An empty object can
        # be used if a completion item does not have any data but also should
        # not use the value from `completionList.itemDefaults.data`.
        #
        # If ApplyKind.Merge, a shallow merge will be performed between
        # `completionList.itemDefaults.data` and the completion's own data
        # using the following rules:
        #
        # - If a completion's `data` field is not provided (or `null`), the
        #   entire `data` field from `completionList.itemDefaults.data` will be
        #   used as-is.
        # - If a completion's `data` field is provided, each field will
        #   overwrite the field of the same name in
        #   `completionList.itemDefaults.data` but no merging of nested fields
        #   within that value will occur.
        #
        # @since 3.18.0
        #
        # @return [ApplyKind]
        def data
          attributes.fetch(:data)
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
