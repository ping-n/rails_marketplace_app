Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :listings
  
  devise_for :users
  get "/payments/session", to: 'payments#stripe_id'
  get "/payments/success", to: "payments#success"
  post "/payments/webhook", to: "payments#webhook"
  root to: "pages#index"
end
