require 'rails_helper'

RSpec.describe 'V1::Users', type: :request do
  include Docs::V1::Users::Api

  let(:user_params) { FactoryBot.attributes_for(:user) }

  describe 'POST /api/v1/auth/users' do
    include Docs::V1::Users::Create

    it 'register new user', :dox do
      post api_v1_auth_users_path, params: user_params
      expect(response).to have_http_status(201)
    end

    it 'not register same user' do
      2.times { post api_v1_auth_users_path, params: user_params }
      expect(response).to have_http_status(422)
      expect(response.body).to include('has already been taken')
    end

    it 'do not register user with uncorrect params' do
      invalid_user = FactoryBot.attributes_for(:user, :no_username, :no_password, :no_password_confirmation,
                                               :not_correct_password_length)
      post api_v1_auth_users_path, params: invalid_user
      expect(response).to have_http_status(422)
    end
  end

  describe 'POST /api/v1/auth/login' do
    include Docs::V1::Authorize::Login

    let(:user) { FactoryBot.create(:user) }

    it 'log in user', :dox do
      post api_v1_auth_login_path, params: { username: user.username, password: user.password }
      expect(response).to have_http_status(200)
      expect(response.body).to include('You are successfully logged in!')
    end

    context 'invalid user' do
      after(:each) do
        expect(response).to have_http_status(404)
        expect(response.body).to include('Couldn\'t find User')
      end

      it 'do not logins user which not registered' do
        invalid_user = FactoryBot.attributes_for(:user, :no_existing_user)
        post api_v1_auth_login_path, params: invalid_user
      end

      it 'do not logins user with invalid username' do
        invalid_user = FactoryBot.attributes_for(:user, :no_username)
        post api_v1_auth_login_path, params: invalid_user
      end

      it 'do not logins user with invalid password' do
        invalid_user = FactoryBot.attributes_for(:user, :no_password)
        post api_v1_auth_login_path, params: invalid_user
      end
    end
  end
end
