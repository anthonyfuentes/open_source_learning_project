
Rails.application.routes.draw do

  root "users#index"
  resources :resources, only: [:new, :create, :show]
  resources :users, only: [:index, :show]
  devise_for :users

end
