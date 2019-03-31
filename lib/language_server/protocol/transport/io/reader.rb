require "json"

module LanguageServer
  module Protocol
    module Transport
      module IO
        class Reader
          attr_reader :io

          def initialize(io)
            @io = io
          end

          def read(&block)
            buffer = ""
            header_parsed = false
            content_length = nil

            while char = io.getc
              buffer << char

              unless header_parsed
                if buffer[-4..-1] == "\r\n" * 2
                  content_length = buffer.match(/Content-Length: (\d+)/i)[1].to_i

                  header_parsed = true
                  buffer.clear
                end
              else
                if buffer.bytesize == content_length
                  request = JSON.parse(buffer, symbolize_names: true)

                  block.call(request)

                  header_parsed = false
                  buffer.clear
                end
              end
            end
          end
        end
      end
    end
  end
end
