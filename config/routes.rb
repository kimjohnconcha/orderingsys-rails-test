Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index]

  #resources :products, only: [:show]

  resources :carts, only: [:index, :create, :destroy]

  root 'products#index'

  get 'products/browse', to: 'products#search'

  get 'products/all_products', to: 'products#all_products'

  get 'products/edit', to: 'products#edit'

  put 'products/update', to: 'products#update'

  resources :products, only: [:show, :create, :new]

  post 'orders/create', to: 'orders#create'

  resources :orders, only: [:index]

  post 'users/new', to: 'registrations#new'

  get 'registration', to: 'registrations#index'
  get 'signin', to: 'registrations#signin'

  post 'users/create', to: 'registrations#create'

  get 'logout', to: 'registrations#destroy'

  get 'contact', to: 'registrations#contact'

end
