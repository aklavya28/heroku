Rails.application.routes.draw do
  root 'pages#home'
  get 'about/:id', to: 'pages#about'

end
