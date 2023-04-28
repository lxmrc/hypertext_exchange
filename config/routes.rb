Rails.application.routes.draw do
  get "about", to: "static_pages#about"
  devise_for :users

  resources :links
  root "links#index"
end
