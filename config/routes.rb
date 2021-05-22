Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  get 'items/new'
  resources :items,only: [:index,:new,:create]
end
