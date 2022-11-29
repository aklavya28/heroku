Rails.application.routes.draw do
  # resources :articles
  root 'pages#home'
  get 'about/:id', to: 'pages#about'
  resources :blogs
  get 'signin', to: 'users#new'
  resources :users, expect: [:new]
  get "login", to: 'sessions#new'
  post "login", to: 'sessions#create'
  delete "logout", to: 'sessions#distroy'
  resources :categories
  resources :testings


end
