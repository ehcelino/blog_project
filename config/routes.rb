Rails.application.routes.draw do
  resources :users
  resources :sessions
  get '/users', to: 'users#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'home#index'
  resources :posts
  resources :comments
end
