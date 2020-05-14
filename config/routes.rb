Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :listings
  
  devise_for :users

  root to: "pages#index"
end
