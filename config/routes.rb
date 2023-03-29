Rails.application.routes.draw do

  
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
    # resources :likes

  end
  put '/posts/:id/like', to: 'posts#like', as: 'like'
  get '/posts/:id/like', to: 'posts#destroy_like', as: 'destroy_like'
  get '/users/:id', to: "users#suspend", as: 'suspend_user'
  put '/users/:id', to: "users#unsuspend", as: 'unsuspend_user'



  


  get  "users/:id", to: "users#show"



 

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
