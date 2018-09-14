Rails.application.routes.draw do
  
  root  to: 'flights#index'

  resources :flights
  resources :bookings, only: [:new,:create,:show,:index]
end
