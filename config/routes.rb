Rails.application.routes.draw do
  root "welcomes#show"

  namespace :api do
    namespace :v1 do
      get "/gigs" => "gigs#create"
    end
  end
end
