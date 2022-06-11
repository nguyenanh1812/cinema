Rails.application.routes.draw do
  get 'show/new'
  get 'screen/new'
  get 'genre/new'
  get 'screens/Show'
  # get 'booking_tickets/show'
  get '/booking_tickets/show/:id', to: 'booking_tickets#show', as: 'show_tickets'
  # get '/booking_ticket/:movie_id', to: 'booking_tickets#show'
  get 'show/:show_id/screen/:id', to: 'screens#show', as: 'screen'
  get 'show/:show_id/booking_tickets/new', to: 'booking_tickets#new', as: 'booking_ticket'
  get 'booking_tickets/index'
  get 'shows/index'
  get 'movie/new'
  post 'movie/new', to: 'movie#create'
  # get 'movie/show'
  get 'movie/index'
  get 'movie/index2'
  patch '/movie/:id', to: 'movie#update', as: 'update_movie'

  get 'users/index'

  get 'errors/not_found'
  get 'errors/internal_server_error'
  get 'password_resets/new'
  get 'password_resets/edit'
  # root 'pages#welcome'
  root 'movie#index'
  resources :users
  resources :movie
  resources :genre
  resources :booking_tickets
  resources :screens
  resources :shows
  resources :account_activations, only: [:edit]

  get 'sessions/new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :password_resets, only: %i[new create edit update]

  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all

  #payment
  post "checkout/create", to: "checkout#create"
end
