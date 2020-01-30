Rails.application.routes.draw do
  
  
  
  resources :line_items
  resources :carts
  devise_for :users
  root 'home#index'
  resources :home
  resources :articles
  resources :types
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
