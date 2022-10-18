Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  namespace :api do
    namespace :v1 do
      resources :bookings, only: [:index]
      resources :users, only: [:create]
      resources :categories, only: [:index]
      resources :genres, only: [:index]
      resources :movies do
        get '/latest_movies/page/:page', action: :latest_movie ,on: :collection, as: 'latest_movie'
      end
      post "/login", to:"users#login"
      delete "/logout", to: "users#destroy"
    end
  end
end
