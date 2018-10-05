Rails.application.routes.draw do
  
  root  to: 'flights#index'

  resources :flights
  resources :bookings do
  	member do
      get :tickets
    end
  end
end
