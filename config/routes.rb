Rails.application.routes.draw do
  root "welcome#show"
  resources :users, only: [:new, :create]
  resources :links, only: [:index]
end
