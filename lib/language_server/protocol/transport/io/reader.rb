# frozen_string_literal: true

require "json"

module LanguageServer
  module Protocol
    module Transport
      module Io
        class Reader
          def initialize(io)
            @io = io
            io.binmode
          end

          def read(&block)
            while buffer = io.gets("\r\n\r\n")
              content_length = buffer.match(/Content-Length: (\d+)/i)[1].to_i
              message = io.read(content_length)
              unless message && message.bytesize == content_length
                raise EOFError, "Unexpected end of JSON-RPC message body"
              end

              request = JSON.parse(message, symbolize_names: true)
              block.call(request)
            end
          end

          def close
            io.close
          end

          private

          attr_reader :io
        end
      end
    end
  end
end
