Rails.application.routes.draw do
  get 'categories/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post '/rounds/', to: 'rounds#create'
  post '/rounds/:round_id/answers/', to: 'answers#create'

  get '/rounds/:round_id/', to: 'rounds#show'
  get '/rounds/:round_id/result', to: 'rounds#result'
  get '/categories', to: 'categories#index'
end
