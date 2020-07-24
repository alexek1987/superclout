Rails.application.routes.draw do
  devise_for :users
  root "brands#index"
  resources :brands do
    resources :listings, only: [:new,:create]
  end
  resources :listings, only: [:show, :index, :edit, :update, :destroy] do
    resources :campaigns, only: [:new, :create]
  end

  resources :campaigns, only: [:index, :show, :edit, :update, :destroy]

end
