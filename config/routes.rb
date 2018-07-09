Rails.application.routes.draw do
  root to: "home#index"
  get 'home/index'

  devise_for :users
  resources :gym_classes do
    resources :scheduler, only: [:new, :create, :destroy]
  end
  resources :scheduler, only: :index
end
