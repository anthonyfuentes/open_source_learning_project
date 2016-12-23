
Rails.application.routes.draw do

  devise_for :users

  root "resources#index"

  resources :users, only: [:show] do
    get "shared", to: "shared_resources#index"
    get "curriculums", to: "users_curriculums#index"
    resources :curriculums, only: [:edit, :update, :destroy]
  end

  resources :resources, only: [:new, :create, :show, :index] do
    resources :feedbacks, only: [:new, :create]
  end

  resources :curriculums, only: [:new, :create, :index, :show] do
    resources :feedbacks, only: [:new, :create]
  end
  resources :comments, only: [:create]
  resources :curriculums_resources, only: [:create, :destroy]

end
