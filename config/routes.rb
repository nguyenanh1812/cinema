Rails.application.routes.draw do
  get 'show/new'
  get 'screen/new'
  #get 'genre/new'
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
  resources :movie do
    member do 
      get :get_movie_info
      get :get_show_by_date
    end
  end
  resources :booking_tickets
  resources :shows
  resources :account_activations, only: [:edit]

  get 'sessions/new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :password_resets, only: %i[new create edit update]

  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all

  #admin-url
  #Shows
  post 'shows/new', to: 'shows#create'
  delete '/shows/:id', to: 'shows#destroy', as: 'delete_show'
  patch '/shows/:id', to: 'shows#update', as: 'update_show' 
  get '/shows/:id/edit', to: 'shows#edit', as: 'edit_shows'

  resources :genre
  post 'genre/new', to: 'genre#create'
  #get '/genre/:id', to: 'genre#update', as: 'update_genre' 
  patch 'genre/:id/edit', to: 'genre#update', as: 'update_genre'
  
  resources :screens
  post 'screens/new', to: 'screens#create'
  patch '/screens/:id/edit', to: 'screens#update', as: 'update_screen'
  delete '/screens/:id', to: 'screens#destroy', as: 'delete_screen'

  #ticket
  get '/booking_tickets/admin/index2', to: 'booking_tickets#index2', as: 'ticket_list'
  patch '/booking_tickets/convert_status/:id', to: 'booking_tickets#convert_status', as: 'convert_status'
  delete '/booking_tickets/destroy/:id', to: 'booking_tickets#destroy', as: 'delete_ticket'

  #payment-script-DaFail
  post "checkout/create", to: "checkout#create"

  #Payment-Paypal
  resources :payments

end
