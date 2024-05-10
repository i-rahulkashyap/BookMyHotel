Rails.application.routes.draw do
  get 'current_user', to: 'current_user#index'
  devise_for :users, path: '', path_names: {
     sign_in: 'login',
     sign_out: 'logout', 
     registration: 'signup' 
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :users
  resources :hotels
  resources :rooms
  resources :reviews
  resources :bookings

  get '/upcoming_bookings', to: 'bookings#upcoming'
  get '/ongoing_bookings', to: 'bookings#ongoing'
  get '/completed_bookings', to: 'bookings#completed'
  get '/cancelled_bookings', to: 'bookings#cancelled'

end
