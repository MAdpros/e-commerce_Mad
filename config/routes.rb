Rails.application.routes.draw do
  
  
  
  devise_for :managers
  resources :liners
  resources :deliveries
  resources :transits
  resources :orders
  resources :line_items
  resources :carts
  devise_for :users
  root 'home#index'
  resources :home
  resources :articles
  resources :types
  resources :products
  resources :charges
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
