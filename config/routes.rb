Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create] do 
        resources :bookings
      end
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
