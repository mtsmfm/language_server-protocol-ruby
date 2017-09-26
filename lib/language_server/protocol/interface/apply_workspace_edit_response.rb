module LanguageServer
  module Protocol
    module Interface
      class ApplyWorkspaceEditResponse < Base
        #
        # Indicates whether the edit was applied or not.
        #
        # @return [boolean]
        define_attribute_method :applied

        def initialize(applied:)
          super
        end
      end
    end
  end
end
