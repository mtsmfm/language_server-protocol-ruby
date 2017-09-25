module LanguageServer
  module Protocol
    module Interface
      class InitializeParams < Base
        attr_required_keys :process_id, :root_uri, :capabilities
        attr_optional_keys :root_path, :initialization_options, :trace
      end
    end
  end
end
