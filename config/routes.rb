Rails.application.routes.draw do
  get "sessions/new"
  root 'static_pages#home'

  # Static pages routes with named paths
  get '/home', to: 'static_pages#home', as: 'home'
  get '/about', to: 'static_pages#about', as: 'about'
  get '/contact', to: 'static_pages#contact', as: 'contact'

  # User routes
  #get '/signup', to: "users#new"
  get '/signup', to: 'users#new'
  resources :users do
    resources :books, only: [:index, :new, :create, :edit, :update, :destroy]
  end
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'
  delete '/logout', to: 'sessions#destroy'

  
  get '/books', to: "static_pages#home"

  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  resources :users
  resources :books, only:[:create, :destroy]
end
