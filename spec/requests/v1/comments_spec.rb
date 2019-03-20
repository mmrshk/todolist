require 'rails_helper'

RSpec.describe 'V1::Comments API', type: :request do
  include Docs::V1::Comments::Api

  let(:user) { FactoryBot.create(:user) }
  let(:token) { JsonWebToken.encode(user_id: user.id) }
  let(:project) { FactoryBot.create(:project, user_id: user.id) }
  let(:task) { FactoryBot.create(:task, project_id: project.id) }
  let!(:comments) { FactoryBot.create_list(:comment, 3, task_id: task.id) }
  let(:comment) { FactoryBot.create(:comment, task_id: task.id) }
  let(:comment_params) { FactoryBot.attributes_for(:comment) }

  let(:headers) { { authorization: token, accept: 'application/json' } }

  describe 'GET /comments' do
    include Docs::V1::Comments::Index

    it 'gets list of comments', :dox do
      get api_v1_project_task_comments_path(project_id: project.id, task_id: task.id), headers: headers
      expect(response).to have_http_status(200)
      expect(response.parsed_body.size).to eq(3)
    end
  end

  describe 'POST /comments', :dox do
    include Docs::V1::Comments::Create
    include Docs::V1::Comments::Edit
    let(:edited_comment) { FactoryBot.attributes_for(:comment, :edited_comment) }
    let(:comment_params) { FactoryBot.attributes_for(:comment, :with_file) }
    let(:comments_count) { comments.count }

    it 'creates new comment' do
      expect do
        post api_v1_project_task_comments_path(project_id: project.id, task_id: task.id), headers: headers,
                                                                                          params: comment_params
      end.to change(Comment, :count).by(1)

      expect(response).to have_http_status(201)
    end

    it 'update existed comment' do
      put api_v1_comment_path(id: comment.id), headers: headers, params: edited_comment
      expect(response).to have_http_status(200)
    end

    it 'creates new comment with file' do
      post api_v1_project_task_comments_path(project_id: project.id, task_id: task.id), headers: headers,
                                                                                        params: comment_params
      expect(response).to have_http_status(201)
    end
  end

  describe 'GET /comment', :dox do
    include Docs::V1::Comments::Get

    it 'get existed comment' do
      get api_v1_comment_path(id: comment.id), headers: headers, params: comment_params
      expect(response).to have_http_status(200)
    end
  end

  describe 'DELETE /comments/:id', :dox do
    include Docs::V1::Comments::Delete

    it 'delete comments' do
      expect { delete api_v1_comment_path(id: comments.first.id), headers: headers }.to change(Comment, :count).by(-1)
      expect(response).to have_http_status(200)
    end
  end
end
