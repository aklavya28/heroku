Rails.application.routes.draw do
  # resources :articles
  root 'pages#home'
  get 'about/:id', to: 'pages#about'
  resources :blogs
end
