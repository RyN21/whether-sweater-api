Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      ## find forecast endpoints
      resources :forecast, only: [:index]
      resources :backgrounds, only: [:index]
      resources :climbing_routes, only: [:index]
    end
  end
end
