Rails.application.routes.draw do
  get 'users/first_name'
  get 'users/last_name'
  get 'users/user_name'
  get 'users/email'
  get 'users/password_digest'
  get 'users/image_url'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
