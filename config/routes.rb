Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :auth do
        resources :users, param: :username
        post '/login', to: 'authentication#login'
      end

      root to: 'projects#index'
      resources :projects do
        resources :tasks, only: %i[index create] do
          resources :comments, only: %i[index create]
        end
      end

      resources :tasks, only: %i[show update destroy]
      resources :comments, only: %i[show update destroy]
    end
  end
end
