require 'rails_helper'

RSpec.describe 'V1::Comments API', type: :request do
  include Docs::V1::Comments::Api

  let(:user) { FactoryBot.create(:user) }
  let(:token) { JsonWebToken.encode(user_id: user.id) }
  let(:project) { FactoryBot.create(:project, user_id: user.id) }
  let(:task) { FactoryBot.create(:task, project_id: project.id) }
  let(:comments) { FactoryBot.create_list(:comment, 3, task_id: task.id) }
  let(:comment) { FactoryBot.create(:comment, task_id: task.id) }
  let(:comment_params) { FactoryBot.attributes_for(:comment) }

  let(:headers) { { authorization: token, accept: 'application/json' } }

  describe 'GET /comments' do
    include Docs::V1::Comments::Index

    it 'gets list of comments', :dox do
      comments
      get "/api/v1/projects/#{project.id}/tasks/#{task.id}/comments", headers: headers
      expect(response).to have_http_status(200)
      expect(response.parsed_body.size).to eq(3)
    end
  end

  describe 'POST /comments', :dox do
    include Docs::V1::Comments::Create

    it 'creates new comment' do
      post "/api/v1/projects/#{project.id}/tasks/#{task.id}/comments", headers: headers, params: comment_params
      expect(response).to have_http_status(201)
    end
  end

  describe 'PUT /comments', :dox do
    include Docs::V1::Comments::Edit

    it 'update existed comment' do
      edited_comment = FactoryBot.attributes_for(:comment, :edited_comment)

      put "/api/v1/comments/#{comment.id}", headers: headers, params: edited_comment
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /comment', :dox do
    include Docs::V1::Comments::Get

    it 'get existed comment' do
      get "/api/v1/comments/#{comment.id}", headers: headers, params: comment_params
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /comments' do
    it 'creates new comment with file' do
      comment_params = FactoryBot.attributes_for(:comment, :with_file)
      post "/api/v1/projects/#{project.id}/tasks/#{task.id}/comments", headers: headers, params: comment_params
      expect(response).to have_http_status(201)
    end
  end

  describe 'DELETE /comments/:id', :dox do
    include Docs::V1::Comments::Delete

    it 'delete comments' do
      delete "/api/v1/comments/#{comment.id}", headers: headers
      expect(response).to have_http_status(204)
    end
  end
end
