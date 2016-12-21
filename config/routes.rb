Rails.application.routes.draw do
  devise_for :users
  resources :curriculum
  root "curriculum#index"
end
