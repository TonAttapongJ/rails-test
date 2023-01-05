Rails.application.routes.draw do
  # namespace :admin do
  #   get 'sessions/index'
  # end

  # api/v1/sessions
  post 'api/v1/users/sign_up', to: 'api/v1/sessions#sign_up'
  post 'api/v1/users/sign_in', to: 'api/v1/sessions#sign_in'
  delete 'api/v1/users/sign_out', to: 'api/v1/sessions#sign_out'
  get 'api/v1/users/me', to: 'api/v1/sessions#me'
  
  # admin
  get 'admin', to: 'admin/products#index'
  patch 'admin/products/:id', to: 'admin/products#update'
  post 'admin/products', to: 'admin/products#create'
  delete 'admin/products/:id/destroy', to: 'admin/products#destroy'
  get 'admin/products', to: 'admin/products#index'
  get 'admin/products/:id/edit', to: 'admin/products#edit'
  get 'admin/products/new', to: 'admin/products#new'
  get 'admin/products/:id', to: 'admin/products#show', as: :product

  # admin sessions
  get 'admin/sessions/sign_in', to: 'admin/sessions#new'
  post 'admin/sessions/sign_in', to: 'admin/sessions#create'

  root 'admin/products#index', :as => :home

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
