module Docs
  module V1
    module Tasks
      extend Dox::DSL::Syntax

      document :api do
        resource 'Tasks' do
          endpoint '/tasks'
          group 'Tasks'
        end
      end

      document :index do
        action 'Get tasks'
      end

      document :create do
        action 'Create task'
      end

      document :edit do
        action 'Edit task'
      end

      document :delete do
        action 'Delete task'
      end
    end
  end
end
