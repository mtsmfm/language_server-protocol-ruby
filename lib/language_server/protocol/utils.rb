module LanguageServer
  module Protocol
    module Utils
      def self.to_lower_camerize(string)
        string = string.dup
        string.sub!(/^\w/) { $&.downcase }
        string.gsub!(/(?:_|(\/))([a-z\d]*)/i) { "#{$1}#{to_capitalize($2)}" }
        string
      end

      def self.to_capitalize(string)
        "#{string.slice(0).upcase}#{string.slice(1..-1).downcase}"
      end
    end
  end
end
