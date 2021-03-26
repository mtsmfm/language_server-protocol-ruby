module LanguageServer
  module Protocol
    module Constant
      module ErrorCodes
        PARSE_ERROR = -32700
        INVALID_REQUEST = -32600
        METHOD_NOT_FOUND = -32601
        INVALID_PARAMS = -32602
        INTERNAL_ERROR = -32603
        #
        # This is the start range of JSON RPC reserved error codes.
        # It doesn't denote a real error code. No LSP error codes should
        # be defined between the start and end range. For backwards
        # compatibility the `ServerNotInitialized` and the `UnknownErrorCode`
        # are left in the range.
        #
        JSONRPC_RESERVED_ERROR_RANGE_START = -32099
        SERVER_ERROR_START = JSONRPC_RESERVED_ERROR_RANGE_START
        SERVER_NOT_INITIALIZED = -32002
        UNKNOWN_ERROR_CODE = -32001
        #
        # This is the start range of JSON RPC reserved error codes.
        # It doesn't denote a real error code.
        #
        JSONRPC_RESERVED_ERROR_RANGE_END = -32000
        SERVER_ERROR_END = JSONRPC_RESERVED_ERROR_RANGE_END
        #
        # This is the start range of LSP reserved error codes.
        # It doesn't denote a real error code.
        #
        LSP_RESERVED_ERROR_RANGE_START = -32899
        CONTENT_MODIFIED = -32801
        REQUEST_CANCELLED = -32800
        #
        # This is the end range of LSP reserved error codes.
        # It doesn't denote a real error code.
        #
        LSP_RESERVED_ERROR_RANGE_END = -32800
      end
    end
  end
end
