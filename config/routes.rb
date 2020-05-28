# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      resources :shelters do
        resources :pets do
          patch '/adopt_me', to: 'pets#adopt_me'
        end
      end
      resources :pets, only: [:index]
      post '/login', to: 'auth#create'
      delete '/logout', to: 'auth#destroy'
      get '/current_user', to: 'auth#show'
      post '/login_shelter', to: 'sessions#create'
      delete '/logout_shelter', to: 'sessions#destroy'
      get '/current_shelter', to: 'sessions#show'
    end
  end
end
