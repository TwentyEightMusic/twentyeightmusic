Rails.application.routes.draw do
  root "welcomes#show"

  namespace :api do
    namespace :v1 do
      resources :gigs, only: [:create]
    end
  end
end
