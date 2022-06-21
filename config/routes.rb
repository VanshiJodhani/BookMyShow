Rails.application.routes.draw do

  root "homes#index"
 
  resources :homes
  resources :users do
    resources :bookings do
      put 'confirm'
      put 'cancel'
    end
  end
  resources :categories, :cities, :locations, :events, :notifications, :roles 
  
  get '/bookings', to: 'bookings#index'
  get '/bookings/show', to: 'bookings#show'
end
