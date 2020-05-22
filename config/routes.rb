Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      resources :shelters do
        resources :pets do
          post '/adopt_me', to: 'pets#adopt_me'
        end
      end
      resources :pets, only: [:index]
      post '/login', to: 'auth#create'
      delete '/logout', to: 'auth#destroy'
      get '/current_user', to: 'auth#show'
    end
  end
end
