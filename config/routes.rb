Rails.application.routes.draw do
  root 'pages#welcome'
  resources :users
  resources :account_activations, only: [:edit]
  
  get 'sessions/new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :account_activations, only: [:edit]

end
