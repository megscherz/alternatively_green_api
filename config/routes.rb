Rails.application.routes.draw do
  get "/users" => "users#index"
  post "/users" => "users#create"
  get "/users/me" => "users#show"
  patch "/users/me" => "users#update"
  delete "/users/me" => "users#destroy"

  post "/sessions" => "sessions#create"

  get "/products" => "products#index"
  post "/products" => "products#create"
  get "/products/:id" => "products#show"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"

  get "/reviews" => "reviews#index"
  post "/reviews" => "reviews#create"
  get "/reviews/:id" => "reviews#show"
  patch "/reviews/:id" => "reviews#update"
  delete "/reviews/:id" => "reviews#destroy"

  post "/product_alternatives" => "product_alternatives#create"
  delete "/product_alternatives/:id" => "product_alternatives#destroy"
end
