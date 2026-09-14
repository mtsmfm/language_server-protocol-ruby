module LanguageServer
  module Protocol
    module Interface
      #
      # A string value used as a snippet is a template which allows to insert text
      # and to control the editor cursor when insertion happens.
      #
      # A snippet can define tab stops and placeholders with `$1`, `$2`
      # and `${3:foo}`. `$0` defines the final tab stop, it defaults to
      # the end of the snippet. Variables are defined with `$name` and
      # `${name:default value}`.
      #
      # @since 3.18.0
      #
      class StringValue
        def initialize(kind:, value:)
          @attributes = {}

          @attributes[:kind] = kind
          @attributes[:value] = value

          @attributes.freeze
        end

        #
        # The kind of string value.
        #
        # @return ["snippet"]
        def kind
          attributes.fetch(:kind)
        end

        #
        # The snippet string.
        #
        # @return [string]
        def value
          attributes.fetch(:value)
        end

        attr_reader :attributes

        def to_hash
          attributes
        end

        def to_json(*args)
          to_hash.to_json(*args)
        end
      end
    end
  end
end
