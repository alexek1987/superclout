Rails.application.routes.draw do
  get 'listings/create'
  get 'listings/destroy'
  get 'listings/show'
  # get 'brands/index'
  # get 'brands/show'
  # get 'brands/new'
  # get 'brands/create'
  root "brands#index"
  resources :brands, only:[:show, :new, :create] do
    resources :listings, only: :create
  end
  resources :listings, only: [:destroy, :show]
end
