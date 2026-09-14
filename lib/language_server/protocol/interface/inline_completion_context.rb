module LanguageServer
  module Protocol
    module Interface
      #
      # Provides information about the context in which an inline completion was requested.
      #
      # @since 3.18.0
      #
      class InlineCompletionContext
        def initialize(trigger_kind:, selected_completion_info: nil)
          @attributes = {}

          @attributes[:triggerKind] = trigger_kind
          @attributes[:selectedCompletionInfo] = selected_completion_info if selected_completion_info

          @attributes.freeze
        end

        #
        # Describes how the inline completion was triggered.
        #
        # @return [InlineCompletionTriggerKind]
        def trigger_kind
          attributes.fetch(:triggerKind)
        end

        #
        # Provides information about the currently selected item in the autocomplete widget if it is visible.
        #
        # @return [SelectedCompletionInfo]
        def selected_completion_info
          attributes.fetch(:selectedCompletionInfo)
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
