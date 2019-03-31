module Docs
  module V1
    module Users
      extend Dox::DSL::Syntax

      document :api do
        resource 'Users' do
          endpoint '/api/v1/auth/users'
          group 'Users'
        end
      end

      document :index do
        action 'Get users'
      end

      document :create do
        action 'Create user'
      end
    end
  end
end
