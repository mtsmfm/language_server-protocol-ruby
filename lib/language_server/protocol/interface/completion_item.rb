module LanguageServer
  module Protocol
    module Interface
      class CompletionItem < Base
        #
        # The label of this completion item. By default
        # also the text that is inserted when selecting
        # this completion.
        #
        # @return [string]
        define_attribute_method :label

        #
        # The kind of this completion item. Based of the kind
        # an icon is chosen by the editor.
        #
        # @return [number]
        define_attribute_method :kind

        #
        # A human-readable string with additional information
        # about this item, like type or symbol information.
        #
        # @return [string]
        define_attribute_method :detail

        #
        # A human-readable string that represents a doc-comment.
        #
        # @return [string]
        define_attribute_method :documentation

        #
        # A string that shoud be used when comparing this item
        # with other items. When `falsy` the label is used.
        #
        # @return [string]
        define_attribute_method :sort_text

        #
        # A string that should be used when filtering a set of
        # completion items. When `falsy` the label is used.
        #
        # @return [string]
        define_attribute_method :filter_text

        #
        # A string that should be inserted a document when selecting
        # this completion. When `falsy` the label is used.
        #
        # @return [string]
        define_attribute_method :insert_text

        #
        # The format of the insert text. The format applies to both the `insertText` property
        # and the `newText` property of a provided `textEdit`.
        #
        # @return [InsertTextFormat]
        define_attribute_method :insert_text_format

        #
        # An edit which is applied to a document when selecting this completion. When an edit is provided the value of
        # `insertText` is ignored.
        #
        # *Note:* The range of the edit must be a single line range and it must contain the position at which completion
        # has been requested.
        #
        # @return [TextEdit]
        define_attribute_method :text_edit

        #
        # An optional array of additional text edits that are applied when
        # selecting this completion. Edits must not overlap with the main edit
        # nor with themselves.
        #
        # @return [TextEdit[]]
        define_attribute_method :additional_text_edits

        #
        # An optional command that is executed *after* inserting this completion. *Note* that
        # additional modifications to the current document should be described with the
        # additionalTextEdits-property.
        #
        # @return [Command]
        define_attribute_method :command

        #
        # An data entry field that is preserved on a completion item between
        # a completion and a completion resolve request.
        #
        # @return [any]
        define_attribute_method :data

        def initialize(label:, kind: nil, detail: nil, documentation: nil, sort_text: nil, filter_text: nil, insert_text: nil, insert_text_format: nil, text_edit: nil, additional_text_edits: nil, command: nil, data: nil)
          super
        end
      end
    end
  end
end
