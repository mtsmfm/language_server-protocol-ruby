module LanguageServer
  module Protocol
    module Constant
      #
      # A type indicating how positions are encoded,
      # specifically what column offsets mean.
      # A set of predefined position encoding kinds.
      #
      module PositionEncodingKind
        #
        # Character offsets count UTF-8 code units.
        #
        U_T_F8 = 'utf-8'
        #
        # Character offsets count UTF-16 code units.
        #
        # This is the default and must always be supported
        # by servers
        #
        U_T_F16 = 'utf-16'
        #
        # Character offsets count UTF-32 code units.
        #
        # Implementation note: these are the same as Unicode code points,
        # so this `PositionEncodingKind` may also be used for an
        # encoding-agnostic representation of character offsets.
        #
        U_T_F32 = 'utf-32'
      end
    end
  end
end
