require 'rails_helper'

RSpec.describe 'V1::Tasks API', type: :request do
  include Docs::V1::Tasks::Api

  let(:user) { FactoryBot.create(:user) }
  let(:token) { JsonWebToken.encode(user_id: user.id) }
  let(:project) { FactoryBot.create(:project, user_id: user.id) }
  let!(:tasks) { FactoryBot.create_list(:task, 3, project_id: project.id) }
  let(:task) { FactoryBot.create(:task, project_id: project.id) }
  let(:task_params) { FactoryBot.attributes_for(:task) }

  let(:headers) { { authorization: token, accept: 'application/json' } }

  describe 'GET /tasks' do
    include Docs::V1::Tasks::Index

    it 'gets list of tasks', :dox do
      get api_v1_project_tasks_path(project_id: project.id), headers: headers
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /tasks' do
    include Docs::V1::Tasks::Create

    it 'creates new task', :dox do
      expect do
        post api_v1_project_tasks_path(project_id: project.id), headers: headers, params: task_params
      end.to change(Task, :count).by(1)

      expect(response).to have_http_status(201)
    end
  end

  describe 'PUT /tasks/:id' do
    include Docs::V1::Tasks::Edit
    let(:edited_task) { FactoryBot.attributes_for(:task, :edited) }

    it 'update tasks', :dox do
      put api_v1_task_path(id: task.id), headers: headers, params: edited_task
      expect(response).to have_http_status(200)
      expect(response.body).to include('edited name')
    end
  end

  describe 'GET /tasks/:id' do
    include Docs::V1::Tasks::Get

    it 'get task', :dox do
      get api_v1_task_path(id: task.id), headers: headers, params: task_params
      expect(response).to have_http_status(200)
    end
  end

  describe 'DELETE /tasks/:id' do
    include Docs::V1::Tasks::Delete

    it 'delete tasks', :dox do
      expect { delete api_v1_task_path(id: tasks.first.id), headers: headers }.to change(Task, :count).by(-1)
      expect(response).to have_http_status(200)
    end
  end
end
