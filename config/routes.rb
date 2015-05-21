Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  root "welcomes#show"

  resources :bootlegs, only: [:index, :new, :create, :destroy] do
    resources :tracks, only: [:new, :create]
  end

  resources :tracks, only: [:destroy]



  namespace :api do
    namespace :v1 do
      resources :gigs, only: [:create, :index]
    end
  end
end
