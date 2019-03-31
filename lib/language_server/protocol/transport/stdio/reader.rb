module LanguageServer
  module Protocol
    module Transport
      module Stdio
        class Reader < IO::Reader
          def initialize
            super STDIN
          end
        end
      end
    end
  end
end
