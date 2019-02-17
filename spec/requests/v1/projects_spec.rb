require 'rails_helper'

RSpec.describe 'V1::Projects API', type: :request do
  include Docs::V1::Projects::Api

  describe 'GET /api/v1/projects' do
    include Docs::V1::Projects::Index

    before { get '/api/v1/projects' }

    it 'gets projects', :dox do
      expect(response).to have_http_status(401)
    end
  end
end
