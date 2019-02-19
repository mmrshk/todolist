module Docs
  module V1
    module Comments
      extend Dox::DSL::Syntax

      document :api do
        resource 'Comments' do
          endpoint '/comments'
          group 'Comments'
        end
      end

      document :index do
        action 'Get comments'
      end

      document :create do
        action 'Create comment'
      end

      document :edit do
        action 'Edit comment'
      end

      document :delete do
        action 'Delete comment'
      end
    end
  end
end
