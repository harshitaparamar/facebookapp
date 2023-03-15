Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  
  get 'users/index'

  devise_for :users
  # resources :users do
  namespace :api do
    resources :posts do
      resources :comments
    end
  end
  # put '/api/posts/:id/like', to: 'posts#like', as: 'like'
  # get '/api/posts/:id/like', to: 'posts#destroy_like', as: 'destroy_like'

     

  

  root "home#index"
  resources :posts do
    resources :comments
  end
  put '/posts/:id/like', to: 'posts#like', as: 'like'
  get '/posts/:id/like', to: 'posts#destroy_like', as: 'destroy_like'
  get  "users/:id", to: "users#show"



 

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
