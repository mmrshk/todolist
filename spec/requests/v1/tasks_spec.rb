require 'rails_helper'

RSpec.describe 'V1::Tasks API', type: :request do
  include Docs::V1::Tasks::Api

  let(:user) { FactoryBot.create(:user) }
  let(:token) { JsonWebToken.encode(user_id: user.id) }
  let(:project) { FactoryBot.create(:project, user_id: user.id) }
  let(:tasks) { FactoryBot.create_list(:task, 3, project_id: project.id) }
  let(:task) { FactoryBot.create(:task, project_id: project.id) }
  let(:task_params) { FactoryBot.attributes_for(:task) }

  let(:headers) { { authorization: token, accept: 'application/json' } }

  describe 'GET /tasks' do
    include Docs::V1::Tasks::Index

    it 'gets list of tasks', :dox do
      tasks
      get "/api/v1/projects/#{project.id}/tasks", headers: headers
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /tasks' do
    include Docs::V1::Tasks::Create

    it 'creates new task', :dox do
      post "/api/v1/projects/#{project.id}/tasks", headers: headers, params: task_params
      expect(response).to have_http_status(201)
    end
  end

  describe 'PUT /tasks/:id' do
    include Docs::V1::Tasks::Edit

    it 'update tasks', :dox do
      edited_task = FactoryBot.attributes_for(:task, :edited)
      put "/api/v1/tasks/#{task.id}", headers: headers, params: edited_task
      expect(response).to have_http_status(200)
      expect(response.body).to include('edited name')
    end
  end

  describe 'DELETE /tasks/:id' do
    include Docs::V1::Tasks::Delete

    it 'delete tasks', :dox do
      delete "/api/v1/tasks/#{task.id}", headers: headers
      expect(response).to have_http_status(200)
    end
  end
end
