Rails.application.routes.draw do
  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'
  # get '/*a', to: 'application#not_found'

  namespace :api do
    namespace :v1 do
      root to: 'projects#index'

      # namespace :auth do
      #   post 'register', to: 'signup#create'
      #   post 'login',    to: 'signin#create'
      # end
      resources :projects do
        resources :tasks
      end
    end
  end
end
