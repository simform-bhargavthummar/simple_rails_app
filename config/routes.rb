Rails.application.routes.draw do
  get 'user_conts/new'
  get '/login', to: "user_conts#check_login"
  post '/login', to: "user_conts#login"
  get '/logout', to: "user_conts#logout"
  get '/search', to: "cars#search"
  root "user_conts#check_login"
  resources :students
  resources :faculties
  resources :books
  resources :authors
  resources :cars
  resources :user_conts
   
  #get "/show/:id" , to: 'authors#show' , as: "show"
  
  # get "/products" , to: 'products#index' , as: "products" 
  # get "/show/:id" , to: 'products#show' , as: "show"
  #root "products#index"
  # get "hello" => "home#hello"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
