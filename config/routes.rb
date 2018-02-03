Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index]

  resources :products

  root 'products#index'

  get 'users/new', to: 'registrations#new'

  get 'registration', to: 'registrations#index'
  get 'signin', to: 'registrations#signin'

  post 'users/create', to: 'registrations#create'

  get 'logout', to: 'registrations#destroy'

end