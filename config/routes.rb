Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create, :new]
  resources :sessions, only: [:show, :create, :new, :destroy]
  get '/users', to: 'users#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'home#index'
  resources :posts, only: [:edit, :show, :create, :new, :update, :destroy]
  resources :comments, only: [:create, :new]
  get 'search_posts', to: 'home#search', as: 'search_posts'

end
