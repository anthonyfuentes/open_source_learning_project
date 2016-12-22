
Rails.application.routes.draw do

  devise_for :users

  root "resources#index"

  resources :users, only: [:show]
  resources :resources, only: [:new, :create, :show, :index] do
    resources :feedbacks, only: [:new, :create]
  end

end
