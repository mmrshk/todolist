module Docs
  module V1
    module Projects
      extend Dox::DSL::Syntax

      # define common resource data for each action
      document :api do
        resource 'Projects' do
          endpoint '/projects'
          group 'Projects'
        end
      end

      # define data for specific action
      document :index do
        action 'Get projects'
      end
    end
  end
end
