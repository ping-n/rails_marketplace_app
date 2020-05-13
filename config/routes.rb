Rails.application.routes.draw do
  
  resources :listings
  
  devise_for :users

  root to: "pages#index"
end
