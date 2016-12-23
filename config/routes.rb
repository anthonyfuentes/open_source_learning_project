
Rails.application.routes.draw do

  devise_for :users

  root "resources#index"

  resources :users, only: [:show] do
    get "shared", to: "shared_resources#index"
    get "curriculums", to: "users_curriculums#index"
  end

  resources :resources, only: [:new, :create, :show, :index] do
    resources :feedbacks, only: [:new, :create]
    resources :comments, only: [:create]
  end

  resources :curriculums, only: [:new, :create, :index, :show] do
    resources :feedbacks, only: [:new, :create]
    resources :comments, only: [:create]
  end

  resources :curriculums_resources, only: [:create, :destroy]

end
