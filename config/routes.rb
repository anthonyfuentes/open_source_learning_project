
Rails.application.routes.draw do

  resources :resources, only: [:new, :create, :show]
  devise_for :users

end
