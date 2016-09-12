Rails.application.routes.draw do
  root "welcome#show"
  delete '/logout' => 'sessions#destroy'
  resources :users, only: [:new, :create]
  resources :links, only: [:index]
end
