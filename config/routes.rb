
Rails.application.routes.draw do

  devise_for :users

  root "resources#new"
  resources :resources, only: [:new, :create, :show]

end
