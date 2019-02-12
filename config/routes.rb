Rails.application.routes.draw do
  apipie
  namespace :api do
    namespace :v1 do
      root to: 'projects#index'

      resources :projects do
        resources :tasks
      end
    end
  end
end
