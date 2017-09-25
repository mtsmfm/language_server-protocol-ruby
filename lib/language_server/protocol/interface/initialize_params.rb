module LanguageServer
  module Protocol
    module Interface
      class InitializeParams < Base
        define_attribute_methods(:process_id, :root_uri, :capabilities, :root_path, :initialization_options, :trace)

        def initialize(process_id:, root_uri:, capabilities:, root_path: nil, initialization_options: nil, trace: nil)
          super
        end
      end
    end
  end
end
