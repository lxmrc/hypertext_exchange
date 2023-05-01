Rails.application.routes.draw do
  devise_for :users
  get "users/:id", to: "users#show", as: "user"

  resources :links
  resources :comments

  root "links#index"
  get "about", to: "static_pages#about"
end
