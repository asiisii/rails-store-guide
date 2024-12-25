Rails.application.routes.draw do
  # Manages user sessions (login/logout)
  resource :session

  # Handles password reset requests with token-based identification
  resources :passwords, param: :token

  # Provides full CRUD functionality for products
  # Nested subscriber routes handle subscriptions (create action only)
  resources :products do
    resources :subscribers, only: [ :create ]
  end
  resource :unsubscribe, only: [ :show ]

  # Sets the root path to the products index page
  root "products#index"
end
