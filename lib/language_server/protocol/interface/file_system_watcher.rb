module LanguageServer
  module Protocol
    module Interface
      class FileSystemWatcher
        def initialize(glob_pattern:, kind: nil)
          @attributes = {}

          @attributes[:globPattern] = glob_pattern
          @attributes[:kind] = kind if kind

          @attributes.freeze
        end

        #
        # The  glob pattern to watch.
        #
        # Glob patterns can have the following syntax:
        # - `*` to match one or more characters in a path segment
        # - `?` to match on one character in a path segment
        # - `**` to match any number of path segments, including none
        # - `{}` to group sub patterns into an OR expression. (e.g. `**​/*.{ts,js}`
        # matches all TypeScript and JavaScript files)
        # - `[]` to declare a range of characters to match in a path segment
        # (e.g., `example.[0-9]` to match on `example.0`, `example.1`, …)
        # - `[!...]` to negate a range of characters to match in a path segment
        # (e.g., `example.[!0-9]` to match on `example.a`, `example.b`, but not
        # `example.0`)
        #
        # @return [string]
        def glob_pattern
          attributes.fetch(:globPattern)
        end

        #
        # The kind of events of interest. If omitted it defaults
        # to WatchKind.Create | WatchKind.Change | WatchKind.Delete
        # which is 7.
        #
        # @return [number]
        def kind
          attributes.fetch(:kind)
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
