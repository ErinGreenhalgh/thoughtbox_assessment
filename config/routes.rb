Rails.application.routes.draw do
  root "welcome#show"
  get    "/login"  => 'sessions#new'
  post   "/login"  => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  resources :users, only: [:new, :create]

  resources :users, only: [:show] do
    resources :links, only: [:index]
  end

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :links, only: [:create, :index, :update]
      get '/alphabetical' => 'links#alphabetical'
    end
  end
end
