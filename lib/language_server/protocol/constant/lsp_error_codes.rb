module LanguageServer
  module Protocol
    module Constant
      module LSPErrorCodes
        #
        # This is the start range of LSP reserved error codes.
        # It doesn't denote a real error code.
        #
        # @since 3.16.0
        #
        LSP_RESERVED_ERROR_RANGE_START = -32899
        #
        # A request failed but it was syntactically correct, e.g the
        # method name was known and the parameters were valid. The error
        # message should contain human readable information about why
        # the request failed.
        #
        # @since 3.17.0
        #
        REQUEST_FAILED = -32803
        #
        # The server cancelled the request. This error code should
        # only be used for requests that explicitly support being
        # server cancellable.
        #
        # @since 3.17.0
        #
        SERVER_CANCELLED = -32802
        #
        # The server detected that the content of a document got
        # modified outside normal conditions. A server should
        # NOT send this error code if it detects a content change
        # in it unprocessed messages. The result even computed
        # on an older state might still be useful for the client.
        #
        # If a client decides that a result is not of any use anymore
        # the client should cancel the request.
        #
        CONTENT_MODIFIED = -32801
        #
        # The client has canceled a request and a server as detected
        # the cancel.
        #
        REQUEST_CANCELLED = -32800
        #
        # This is the end range of LSP reserved error codes.
        # It doesn't denote a real error code.
        #
        # @since 3.16.0
        #
        LSP_RESERVED_ERROR_RANGE_END = -32800
      end
    end
  end
end
