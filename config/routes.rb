Rails.application.routes.draw do
  
  get 'attendance/create'

  root 'static_pages#index'
  
  get '/signup',  to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login',   to: 'sessions#new'
  post '/login',  to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'

  resources :users
  resources :events
  resources :attendance
  
end
