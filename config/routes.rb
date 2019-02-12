Rails.application.routes.draw do
  apipie
  namespace :api do
    namespace :v1 do
      root to: 'projects#index'

      namespace :auth do
        post 'register', to: 'signup#create'
        post 'login',    to: 'signin#create'
      end

      resources :projects do
        resources :tasks
      end
    end
  end
end
