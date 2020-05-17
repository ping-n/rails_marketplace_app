Rails.application.routes.draw do
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  resources :listings
  resources :carts, only: [:create, :index]
  devise_for :users
  resources :profiles, only: [:show, :update, :edit]
  delete "/cart", to: "carts#destroy", as: "destroy_cart"
  get "/payments/session", to: "payments#stripe_id"
  get "/payments/success", to: "payments#success"
  post "/payments/webhook", to: "payments#webhook"
  root to: "pages#index"
end
