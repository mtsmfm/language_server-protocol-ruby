module LanguageServer
  module Protocol
    module Transport
      module IO
        class Writer
          attr_reader :io

          def initialize(io)
            @io = io
          end

          def write(response)
            response_str = response.merge(
              jsonrpc: "2.0"
            ).to_json

            headers = {
              "Content-Length" => response_str.bytesize
            }

            headers.each do |k, v|
              io.print "#{k}: #{v}\r\n"
            end

            io.print "\r\n"

            io.print response_str
            io.flush
          end
        end
      end
    end
  end
end
