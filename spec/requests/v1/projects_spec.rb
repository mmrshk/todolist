require 'rails_helper'

RSpec.describe 'V1::Projects API', type: :request do
  include Docs::V1::Projects::Api

  let(:user) { FactoryBot.create(:user) }
  let(:token) { JsonWebToken.encode(user_id: user.id) }
  let!(:projects) { FactoryBot.create_list(:project, 3, user_id: user.id) }
  let(:project) { FactoryBot.create(:project, user_id: user.id) }
  let(:project_params) { FactoryBot.attributes_for(:project) }
  let(:headers) { { authorization: token, accept: 'application/json' } }

  describe 'GET /api/v1/projects' do
    include Docs::V1::Projects::Index

    it 'gets list of projects', :dox do
      get api_v1_projects_path, headers: headers
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /api/v1/projects' do
    include Docs::V1::Projects::Create

    it 'creates new project', :dox do
      expect { post api_v1_projects_path, headers: headers, params: project_params }.to change(Project, :count).by(1)
      expect(response).to have_http_status(201)
    end
  end

  describe 'PUT /api/v1/projects/:id' do
    include Docs::V1::Projects::Edit
    let(:edited_project) { FactoryBot.attributes_for(:project, :edited) }

    it 'edit existed project', :dox do
      put api_v1_project_path(id: project.id), headers: headers, params: edited_project
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/v1/projects/:id' do
    include Docs::V1::Projects::Get

    it 'get existed project', :dox do
      get api_v1_project_path(id: project.id), headers: headers, params: project_params
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /projects' do
    it 'do not creates duplicate project' do
      2.times { post api_v1_projects_path, headers: headers, params: project_params }
      expect(response).to have_http_status(422)
      expect(response.body).to include('The project with such name does already exist.')
    end
  end

  describe 'DELETE /projects/:id' do
    include Docs::V1::Projects::Delete

    it 'delete project', :dox do
      expect { delete api_v1_project_path(id: projects.first.id), headers: headers }.to change(Project, :count).by(-1)
      expect(response).to have_http_status(200)
    end
  end
end
