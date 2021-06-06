Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  get 'orders/create', to: 'orders#create'
  
  resources :items do
    resources :orders, only: [:index,:create]
  end
end
