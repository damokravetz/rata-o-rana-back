Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :profiles, only: %i[ index show ] do
        get :search, on: :collection
        resources :votes, only: %i[ create ]
      end
    end
  end
end
