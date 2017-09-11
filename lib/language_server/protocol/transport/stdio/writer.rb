module LanguageServer
  module Protocol
    module Transport
      module Stdio
        class Writer
          def write(response)
            response_str = response.merge(
              jsonrpc: "2.0"
            ).to_json

            headers = {
              "Content-Length" => response_str.bytesize
            }

            headers.each do |k, v|
              STDOUT.print "#{k}: #{v}\r\n"
            end

            STDOUT.print "\r\n"

            STDOUT.print response_str
            STDOUT.flush
          end
        end
      end
    end
  end
end
