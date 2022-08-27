module LanguageServer
  module Protocol
    module Constant
      #
      # Predefined error codes.
      #
      module ErrorCodes
        PARSE_ERROR = -32700
        INVALID_REQUEST = -32600
        METHOD_NOT_FOUND = -32601
        INVALID_PARAMS = -32602
        INTERNAL_ERROR = -32603
        #
        # This is the start range of JSON RPC reserved error codes.
        # It doesn't denote a real error code. No application error codes should
        # be defined between the start and end range. For backwards
        # compatibility the `ServerNotInitialized` and the `UnknownErrorCode`
        # are left in the range.
        #
        # @since 3.16.0
        #
        JSONRPC_RESERVED_ERROR_RANGE_START = -32099
        #
        # @deprecated use  jsonrpcReservedErrorRangeStart */
        #
        SERVER_ERROR_START = -32099
        #
        # Error code indicating that a server received a notification or
        # request before the server has received the `initialize` request.
        #
        SERVER_NOT_INITIALIZED = -32002
        UNKNOWN_ERROR_CODE = -32001
        #
        # This is the end range of JSON RPC reserved error codes.
        # It doesn't denote a real error code.
        #
        # @since 3.16.0
        #
        JSONRPC_RESERVED_ERROR_RANGE_END = -32000
        #
        # @deprecated use  jsonrpcReservedErrorRangeEnd */
        #
        SERVER_ERROR_END = -32000
      end
    end
  end
end
