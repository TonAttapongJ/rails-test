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
  get 'admin/sessions', to: 'admin/sessions#index'

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
