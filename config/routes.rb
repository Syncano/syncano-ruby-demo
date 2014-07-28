Rails.application.routes.draw do

  devise_for :users
  resources :auctions, only: [:new, :create, :edit, :update, :destroy]
  resources :categories, only: [] do
    resources :auctions, only: [:index]
  end
  resources :notification_settings, only: [:index, :new, :create, :edit, :update, :destroy]

  root 'auctions#index'
end
