module LanguageServer
  module Protocol
    module Interface
      class CompletionItem
        def initialize(label:, kind: nil, tags: nil, detail: nil, documentation: nil, deprecated: nil, preselect: nil, sort_text: nil, filter_text: nil, insert_text: nil, insert_text_format: nil, text_edit: nil, additional_text_edits: nil, commit_characters: nil, command: nil, data: nil)
          @attributes = {}

          @attributes[:label] = label
          @attributes[:kind] = kind if kind
          @attributes[:tags] = tags if tags
          @attributes[:detail] = detail if detail
          @attributes[:documentation] = documentation if documentation
          @attributes[:deprecated] = deprecated if deprecated
          @attributes[:preselect] = preselect if preselect
          @attributes[:sortText] = sort_text if sort_text
          @attributes[:filterText] = filter_text if filter_text
          @attributes[:insertText] = insert_text if insert_text
          @attributes[:insertTextFormat] = insert_text_format if insert_text_format
          @attributes[:textEdit] = text_edit if text_edit
          @attributes[:additionalTextEdits] = additional_text_edits if additional_text_edits
          @attributes[:commitCharacters] = commit_characters if commit_characters
          @attributes[:command] = command if command
          @attributes[:data] = data if data

          @attributes.freeze
        end

        #
        # The label of this completion item. By default
        # also the text that is inserted when selecting
        # this completion.
        #
        # @return [string]
        def label
          attributes.fetch(:label)
        end

        #
        # The kind of this completion item. Based of the kind
        # an icon is chosen by the editor. The standardized set
        # of available values is defined in `CompletionItemKind`.
        #
        # @return [number]
        def kind
          attributes.fetch(:kind)
        end

        #
        # Tags for this completion item.
        #
        # @return [1[]]
        def tags
          attributes.fetch(:tags)
        end

        #
        # A human-readable string with additional information
        # about this item, like type or symbol information.
        #
        # @return [string]
        def detail
          attributes.fetch(:detail)
        end

        #
        # A human-readable string that represents a doc-comment.
        #
        # @return [string | MarkupContent]
        def documentation
          attributes.fetch(:documentation)
        end

        #
        # Indicates if this item is deprecated.
        #
        # @return [boolean]
        def deprecated
          attributes.fetch(:deprecated)
        end

        #
        # Select this item when showing.
        #
        # *Note* that only one completion item can be selected and that the
        # tool / client decides which item that is. The rule is that the *first*
        # item of those that match best is selected.
        #
        # @return [boolean]
        def preselect
          attributes.fetch(:preselect)
        end

        #
        # A string that should be used when comparing this item
        # with other items. When `falsy` the label is used.
        #
        # @return [string]
        def sort_text
          attributes.fetch(:sortText)
        end

        #
        # A string that should be used when filtering a set of
        # completion items. When `falsy` the label is used.
        #
        # @return [string]
        def filter_text
          attributes.fetch(:filterText)
        end

        #
        # A string that should be inserted into a document when selecting
        # this completion. When `falsy` the label is used.
        #
        # The `insertText` is subject to interpretation by the client side.
        # Some tools might not take the string literally. For example
        # VS Code when code complete is requested in this example `con<cursor position>`
        # and a completion item with an `insertText` of `console` is provided it
        # will only insert `sole`. Therefore it is recommended to use `textEdit` instead
        # since it avoids additional client side interpretation.
        #
        # @return [string]
        def insert_text
          attributes.fetch(:insertText)
        end

        #
        # The format of the insert text. The format applies to both the `insertText` property
        # and the `newText` property of a provided `textEdit`. If omitted defaults to
        # `InsertTextFormat.PlainText`.
        #
        # @return [DiagnosticTag]
        def insert_text_format
          attributes.fetch(:insertTextFormat)
        end

        #
        # An edit which is applied to a document when selecting this completion. When an edit is provided the value of
        # `insertText` is ignored.
        #
        # *Note:* The range of the edit must be a single line range and it must contain the position at which completion
        # has been requested.
        #
        # @return [TextEdit]
        def text_edit
          attributes.fetch(:textEdit)
        end

        #
        # An optional array of additional text edits that are applied when
        # selecting this completion. Edits must not overlap (including the same insert position)
        # with the main edit nor with themselves.
        #
        # Additional text edits should be used to change text unrelated to the current cursor position
        # (for example adding an import statement at the top of the file if the completion item will
        # insert an unqualified type).
        #
        # @return [TextEdit[]]
        def additional_text_edits
          attributes.fetch(:additionalTextEdits)
        end

        #
        # An optional set of characters that when pressed while this completion is active will accept it first and
        # then type that character. *Note* that all commit characters should have `length=1` and that superfluous
        # characters will be ignored.
        #
        # @return [string[]]
        def commit_characters
          attributes.fetch(:commitCharacters)
        end

        #
        # An optional command that is executed *after* inserting this completion. *Note* that
        # additional modifications to the current document should be described with the
        # additionalTextEdits-property.
        #
        # @return [Command]
        def command
          attributes.fetch(:command)
        end

        #
        # A data entry field that is preserved on a completion item between
        # a completion and a completion resolve request.
        #
        # @return [any]
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
