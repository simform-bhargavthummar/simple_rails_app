Rails.application.routes.draw do
  #root "students#index"
  root "employees#index"
  get '/others', to: "employees#other_operations"
  post '/find_email', to: "employees#find_email"
  get '/update_order', to: "employees#update_order"
  get '/decrese_order', to: "employees#change_order"


  get '/sign_in', to: "sessions#new"
  post '/sign_in', to: "sessions#create"
  root "students#index"
  get '/logout', to: "sessions#logout"
  get '/enrol', to: "enrols#create_enrol"
  post '/enrol', to: "users#index"
  post 'users/filter', to: "users#event_filter"
  
  
  resources :users
  resources :students
  resources :faculties
  resources :books
  resources :authors
  resources :employees
  resources :sessions
  resources :events
  resources :enrols 
  resources :categories
  resources :comments
  #get "/show/:id" , to: 'authors#show' , as: "show"
  # get "/products" , to: 'products#index' , as: "products" 
  # get "/show/:id" , to: 'products#show' , as: "show"
  #root "products#index"
  # get "hello" => "home#hello"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
