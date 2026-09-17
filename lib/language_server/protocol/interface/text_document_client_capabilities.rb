module LanguageServer
  module Protocol
    module Interface
      #
      # Text document specific client capabilities.
      #
      class TextDocumentClientCapabilities
        def initialize(synchronization: nil, filters: nil, completion: nil, hover: nil, signature_help: nil, declaration: nil, definition: nil, type_definition: nil, implementation: nil, references: nil, document_highlight: nil, document_symbol: nil, code_action: nil, code_lens: nil, document_link: nil, color_provider: nil, formatting: nil, range_formatting: nil, on_type_formatting: nil, rename: nil, folding_range: nil, selection_range: nil, publish_diagnostics: nil, call_hierarchy: nil, semantic_tokens: nil, linked_editing_range: nil, moniker: nil, type_hierarchy: nil, inline_value: nil, inlay_hint: nil, diagnostic: nil, inline_completion: nil)
          @attributes = {}

          @attributes[:synchronization] = synchronization unless synchronization.nil?
          @attributes[:filters] = filters unless filters.nil?
          @attributes[:completion] = completion unless completion.nil?
          @attributes[:hover] = hover unless hover.nil?
          @attributes[:signatureHelp] = signature_help unless signature_help.nil?
          @attributes[:declaration] = declaration unless declaration.nil?
          @attributes[:definition] = definition unless definition.nil?
          @attributes[:typeDefinition] = type_definition unless type_definition.nil?
          @attributes[:implementation] = implementation unless implementation.nil?
          @attributes[:references] = references unless references.nil?
          @attributes[:documentHighlight] = document_highlight unless document_highlight.nil?
          @attributes[:documentSymbol] = document_symbol unless document_symbol.nil?
          @attributes[:codeAction] = code_action unless code_action.nil?
          @attributes[:codeLens] = code_lens unless code_lens.nil?
          @attributes[:documentLink] = document_link unless document_link.nil?
          @attributes[:colorProvider] = color_provider unless color_provider.nil?
          @attributes[:formatting] = formatting unless formatting.nil?
          @attributes[:rangeFormatting] = range_formatting unless range_formatting.nil?
          @attributes[:onTypeFormatting] = on_type_formatting unless on_type_formatting.nil?
          @attributes[:rename] = rename unless rename.nil?
          @attributes[:foldingRange] = folding_range unless folding_range.nil?
          @attributes[:selectionRange] = selection_range unless selection_range.nil?
          @attributes[:publishDiagnostics] = publish_diagnostics unless publish_diagnostics.nil?
          @attributes[:callHierarchy] = call_hierarchy unless call_hierarchy.nil?
          @attributes[:semanticTokens] = semantic_tokens unless semantic_tokens.nil?
          @attributes[:linkedEditingRange] = linked_editing_range unless linked_editing_range.nil?
          @attributes[:moniker] = moniker unless moniker.nil?
          @attributes[:typeHierarchy] = type_hierarchy unless type_hierarchy.nil?
          @attributes[:inlineValue] = inline_value unless inline_value.nil?
          @attributes[:inlayHint] = inlay_hint unless inlay_hint.nil?
          @attributes[:diagnostic] = diagnostic unless diagnostic.nil?
          @attributes[:inlineCompletion] = inline_completion unless inline_completion.nil?

          @attributes.freeze
        end

        #
        # Defines which synchronization capabilities the client supports.
        #
        # @return [TextDocumentSyncClientCapabilities]
        def synchronization
          attributes.fetch(:synchronization)
        end

        #
        # Defines which filters the client supports.
        #
        # @since 3.18.0
        #
        # @return [TextDocumentFilterClientCapabilities]
        def filters
          attributes.fetch(:filters)
        end

        #
        # Capabilities specific to the `textDocument/completion` request.
        #
        # @return [CompletionClientCapabilities]
        def completion
          attributes.fetch(:completion)
        end

        #
        # Capabilities specific to the `textDocument/hover` request.
        #
        # @return [HoverClientCapabilities]
        def hover
          attributes.fetch(:hover)
        end

        #
        # Capabilities specific to the `textDocument/signatureHelp` request.
        #
        # @return [SignatureHelpClientCapabilities]
        def signature_help
          attributes.fetch(:signatureHelp)
        end

        #
        # Capabilities specific to the `textDocument/declaration` request.
        #
        # @since 3.14.0
        #
        # @return [DeclarationClientCapabilities]
        def declaration
          attributes.fetch(:declaration)
        end

        #
        # Capabilities specific to the `textDocument/definition` request.
        #
        # @return [DefinitionClientCapabilities]
        def definition
          attributes.fetch(:definition)
        end

        #
        # Capabilities specific to the `textDocument/typeDefinition` request.
        #
        # @since 3.6.0
        #
        # @return [TypeDefinitionClientCapabilities]
        def type_definition
          attributes.fetch(:typeDefinition)
        end

        #
        # Capabilities specific to the `textDocument/implementation` request.
        #
        # @since 3.6.0
        #
        # @return [ImplementationClientCapabilities]
        def implementation
          attributes.fetch(:implementation)
        end

        #
        # Capabilities specific to the `textDocument/references` request.
        #
        # @return [ReferenceClientCapabilities]
        def references
          attributes.fetch(:references)
        end

        #
        # Capabilities specific to the `textDocument/documentHighlight` request.
        #
        # @return [DocumentHighlightClientCapabilities]
        def document_highlight
          attributes.fetch(:documentHighlight)
        end

        #
        # Capabilities specific to the `textDocument/documentSymbol` request.
        #
        # @return [DocumentSymbolClientCapabilities]
        def document_symbol
          attributes.fetch(:documentSymbol)
        end

        #
        # Capabilities specific to the `textDocument/codeAction` request.
        #
        # @return [CodeActionClientCapabilities]
        def code_action
          attributes.fetch(:codeAction)
        end

        #
        # Capabilities specific to the `textDocument/codeLens` request.
        #
        # @return [CodeLensClientCapabilities]
        def code_lens
          attributes.fetch(:codeLens)
        end

        #
        # Capabilities specific to the `textDocument/documentLink` request.
        #
        # @return [DocumentLinkClientCapabilities]
        def document_link
          attributes.fetch(:documentLink)
        end

        #
        # Capabilities specific to the `textDocument/documentColor` and the
        # `textDocument/colorPresentation` request.
        #
        # @since 3.6.0
        #
        # @return [DocumentColorClientCapabilities]
        def color_provider
          attributes.fetch(:colorProvider)
        end

        #
        # Capabilities specific to the `textDocument/formatting` request.
        #
        # @return [DocumentFormattingClientCapabilities]
        def formatting
          attributes.fetch(:formatting)
        end

        #
        # Capabilities specific to the `textDocument/rangeFormatting` request.
        #
        # @return [DocumentRangeFormattingClientCapabilities]
        def range_formatting
          attributes.fetch(:rangeFormatting)
        end

        #
        # Capabilities specific to the `textDocument/onTypeFormatting` request.
        #
        # @return [DocumentOnTypeFormattingClientCapabilities]
        def on_type_formatting
          attributes.fetch(:onTypeFormatting)
        end

        #
        # Capabilities specific to the `textDocument/rename` request.
        #
        # @return [RenameClientCapabilities]
        def rename
          attributes.fetch(:rename)
        end

        #
        # Capabilities specific to the `textDocument/foldingRange` request.
        #
        # @since 3.10.0
        #
        # @return [FoldingRangeClientCapabilities]
        def folding_range
          attributes.fetch(:foldingRange)
        end

        #
        # Capabilities specific to the `textDocument/selectionRange` request.
        #
        # @since 3.15.0
        #
        # @return [SelectionRangeClientCapabilities]
        def selection_range
          attributes.fetch(:selectionRange)
        end

        #
        # Capabilities specific to the `textDocument/publishDiagnostics` notification.
        #
        # @return [PublishDiagnosticsClientCapabilities]
        def publish_diagnostics
          attributes.fetch(:publishDiagnostics)
        end

        #
        # Capabilities specific to the various call hierarchy requests.
        #
        # @since 3.16.0
        #
        # @return [CallHierarchyClientCapabilities]
        def call_hierarchy
          attributes.fetch(:callHierarchy)
        end

        #
        # Capabilities specific to the various semantic token request.
        #
        # @since 3.16.0
        #
        # @return [SemanticTokensClientCapabilities]
        def semantic_tokens
          attributes.fetch(:semanticTokens)
        end

        #
        # Capabilities specific to the `textDocument/linkedEditingRange` request.
        #
        # @since 3.16.0
        #
        # @return [LinkedEditingRangeClientCapabilities]
        def linked_editing_range
          attributes.fetch(:linkedEditingRange)
        end

        #
        # Client capabilities specific to the `textDocument/moniker` request.
        #
        # @since 3.16.0
        #
        # @return [MonikerClientCapabilities]
        def moniker
          attributes.fetch(:moniker)
        end

        #
        # Capabilities specific to the various type hierarchy requests.
        #
        # @since 3.17.0
        #
        # @return [TypeHierarchyClientCapabilities]
        def type_hierarchy
          attributes.fetch(:typeHierarchy)
        end

        #
        # Capabilities specific to the `textDocument/inlineValue` request.
        #
        # @since 3.17.0
        #
        # @return [InlineValueClientCapabilities]
        def inline_value
          attributes.fetch(:inlineValue)
        end

        #
        # Capabilities specific to the `textDocument/inlayHint` request.
        #
        # @since 3.17.0
        #
        # @return [InlayHintClientCapabilities]
        def inlay_hint
          attributes.fetch(:inlayHint)
        end

        #
        # Capabilities specific to the diagnostic pull model.
        #
        # @since 3.17.0
        #
        # @return [DiagnosticClientCapabilities]
        def diagnostic
          attributes.fetch(:diagnostic)
        end

        #
        # Client capabilities specific to inline completions.
        #
        # @since 3.18.0
        #
        # @return [InlineCompletionClientCapabilities]
        def inline_completion
          attributes.fetch(:inlineCompletion)
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
