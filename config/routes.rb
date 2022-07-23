Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :profiles, only: %i[ index show ] do
        collection do
          get :search
          resources :rankings, only: %i[ index ]
        end
        resources :votes, only: %i[ create ]
      end
    end
  end
end
