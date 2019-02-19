module Docs
  module V1
    module Projects
      extend Dox::DSL::Syntax

      document :api do
        resource 'Projects' do
          endpoint '/projects'
          group 'Projects'
        end
      end

      document :index do
        action 'Get projects'
      end

      document :get do
        action 'Get project'
      end

      document :create do
        action 'Create project'
      end

      document :edit do
        action 'Edit project'
      end

      document :delete do
        action 'Delete project'
      end
    end
  end
end
