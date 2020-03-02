Rails.application.routes.draw do
  

  resources :comments
  devise_for :managers
  resources :liners
  resources :deliveries
  resources :transits
  resources :orders
  resources :line_items

  resources :line_items do
    get 'decrease', on: :member
    get 'increase', on: :member
  end

  resources :carts
  devise_for :users
  root 'home#index'
  resources :home
  resources :articles

   resources :articles, only: [:show] do
     resources :pictures, only: [:create]
  end

    resources :articles do
      resources :comments
    end
  resources :types
  resources :products
  resources :charges
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
