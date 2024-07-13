Rails.application.routes.draw do
 
  namespace :api do 
    namespace :v1 do 
      resources :blogs, only: [:index, :show]
      resources :authors do 
        resources :blogs
      end 
      devise_for :admins, controllers: {
        sessions: 'api/v1/admin/sessions' # Ensure this path matches your controller location
      }


    end
    namespace :v2 do
      resources :agric_galleries, only: [:index, :show, :create, :destroy]
      resources :family_galleries, only: [:index, :show, :create, :destroy]
    end
      namespace :v3 do
        resources :contact, only: [:index, :create]
        resources :volunteer, only: [:create]
      end
    end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "api/v1/authors#index" 


end
