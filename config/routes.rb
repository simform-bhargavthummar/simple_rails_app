Rails.application.routes.draw do
 
  get "/products" , to: 'products#index' , as: "products" 
  get "/show/:id" , to: 'products#show' , as: "show"

  root "products#index"
 # get "hello" => "home#hello"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
