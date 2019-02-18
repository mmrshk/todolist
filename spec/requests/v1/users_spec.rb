require 'rails_helper'

RSpec.describe 'V1::Users', type: :request do
  include Docs::V1::Users::Api

  let(:user_params) { FactoryBot.attributes_for(:user) }
  # let(:token) { JsonWebToken.encode(user_id: user_params[:id]) }
  # let(:headers) { { authorization: token, accept: 'application/json' } }

  # describe 'GET /api/v1/auth/users' do
  #   include Docs::V1::Users::Index
  #
  #   it 'gets users', :dox do
  #     get api_v1_auth_users_path, headers: headers
  #     expect(response).to have_http_status(201)
  #   end
  # end

  describe 'POST /api/v1/auth/users' do
    include Docs::V1::Users::Create

    it 'register new user', :dox do
      post api_v1_auth_users_path, params: user_params
      expect(response).to have_http_status(201)
    end

    it 'not register same user' do
      2.times { post api_v1_auth_users_path, params: user_params }
      expect(response).to have_http_status(422)
      expect(response.body).to include('Username has already been taken')
    end

    context 'invalid user' do
      after(:each) { expect(response).to have_http_status(422) }

      it 'do not register user without username' do
        invalid_user = FactoryBot.attributes_for(:user, :no_username)
        post api_v1_auth_users_path, params: invalid_user
        expect(response.body).to include('Username can\'t be blank')
      end

      it 'do not register user without password' do
        invalid_user = FactoryBot.attributes_for(:user, :no_password)
        post api_v1_auth_users_path, params: invalid_user
        expect(response.body).to include('Password can\'t be blank')
      end

      it 'do not register user without confirmation password' do
        invalid_user = FactoryBot.attributes_for(:user, :no_password_confirmation)
        post api_v1_auth_users_path, params: invalid_user
        expect(response.body).to include('Password confirmation can\'t be blank')
      end

      it 'do not register user with too short username' do
        invalid_user = FactoryBot.attributes_for(:user, :short_username)
        post api_v1_auth_users_path, params: invalid_user
        expect(response.body).to include('Username is too short (minimum is 3 characters)')
      end

      it 'do not register user with too long username' do
        invalid_user = FactoryBot.attributes_for(:user, :long_username)
        post api_v1_auth_users_path, params: invalid_user
        expect(response.body).to include('Username is too long (maximum is 50 characters)')
      end

      it 'do not register user with not correct password length' do
        invalid_user = FactoryBot.attributes_for(:user, :not_correct_password_length)
        post api_v1_auth_users_path, params: invalid_user
        expect(response.body).to include('Password is the wrong length (should be 8 characters)')
      end
    end
  end

  describe 'POST /api/v1/auth/login' do
    include Docs::V1::Authorize::Login

    let(:user) { FactoryBot.create(:user) }

    it 'log in user', :dox do
      post api_v1_auth_login_path, params: {username: user.username, password: user.password}
      expect(response).to have_http_status(200)
      expect(response.body).to include('You are successfully logged in!')
    end

    context 'invalid user' do
      after(:each) do
        expect(response).to have_http_status(401)
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
