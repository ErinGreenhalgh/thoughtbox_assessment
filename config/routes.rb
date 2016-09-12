Rails.application.routes.draw do
  root "welcome#show"
  delete '/logout' => 'sessions#destroy'
  resources :users, only: [:new, :create]
  resources :links, only: [:index]

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :links, only: [:create]
    end
  end
end
