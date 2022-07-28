Rails.application.routes.draw do
  get 'categories/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post '/rounds/', to: 'rounds#create'
  post '/rounds/answers/', to: 'rounds#answers'
  get '/rounds', to: 'rounds#index'
  get '/rounds/result', to: 'rounds#result'
  get '/categories', to: 'categories#show'
end
