Rails.application.routes.draw do
  # Session management (login/logout)
  resource :session

  # Password management  (reset functionality with token parameter)
  resources :passwords, param: :token

  # Product management (all RESTful actions)
  resources :products


  # Defines the root path route ("/")
  root "products#index"
end
