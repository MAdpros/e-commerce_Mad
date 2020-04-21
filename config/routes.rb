Rails.application.routes.draw do
  
devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :zones
  resources :comments

  devise_for :managers

  get '/search' => 'pages#search', :as => 'search_page'
  
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
  resources :products do
    resources :likes
  end
  resources :charges
  resources :users

  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
