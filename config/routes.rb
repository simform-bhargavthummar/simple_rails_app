Rails.application.routes.draw do
  #root "students#index"
  #root "employees#index"
  #root "customers#root"
  # root "user_conts#check_login"
  root "product_routes#index"
  get '/others', to: "employees#other_operations"
  post '/find_email', to: "employees#find_email"
  get '/update_order', to: "employees#update_order"
  get '/decrese_order', to: "employees#change_order"

  get '/sign_in', to: "sessions#new"
  post '/sign_in', to: "sessions#create"
  get '/logout', to: "sessions#logout"
  get '/enrol', to: "enrols#create_enrol"
  post '/enrol', to: "users#index"
  post 'users/filter', to: "users#event_filter"
 
  get '/query', to: "customers#query"
  get '/manual_active', to: "query_products#all_products"
  post 'orders/find_product', to: "orders#find_product"
  get 'user_conts/new'
  get '/login', to: "user_conts#check_login"
  post '/login', to: "user_conts#login"
  get '/logout', to: "user_conts#logout"
  get '/search', to: "cars#search"
  

  resources :query_products
  resources :customers
  resources :orders
  resources :users
  resources :product_routes do
    resources :order_routes
  end

  namespace :business do
    resources :customer_routes, only: [ :index, :new, :create, :edit, :update ]
    get '/preview', to: "customer_routes#preview"
    delete '/delete/:id', to: "customer_routes#delete_customer"
    get '/search', to: "customer_routes#search", as: "search"
  end

  namespace :api do
    resources :v1 
  end

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
  resources :cars
  resources :user_conts

end
