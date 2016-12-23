
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
    resources :comments, only: [:create]
  end

  resources :curriculums, only: [:new, :create, :index, :show] do
    resources :feedbacks, only: [:new, :create]
    resources :comments, only: [:create]
    get "upcoming", to: "curriculum_upcoming#index"
    get "progress", to: "curriculum_progress#index"
  end

  resources :curriculums_resources, only: [:create, :destroy]
  resources :curriculums_users, only: [:create, :destroy]

end
