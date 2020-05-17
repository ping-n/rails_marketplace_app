Rails.application.routes.draw do
  # routes for admin
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  # routes for listing
  resources :listings
  # routes for cart
  resources :carts, only: [:create, :index]
  delete "/cart", to: "carts#destroy", as: "destroy_cart"
  # routes for users through devise 
  devise_for :users
  # routes for profile
  resources :profiles, only: [:show, :edit, :update]
  # routes for payment
  get "/payments/session", to: "payments#stripe_id"
  get "/payments/success", to: "payments#success"
  post "/payments/webhook", to: "payments#webhook"
  root to: "pages#index"
end
