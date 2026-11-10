Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  scope path: "/api" do
    post "login", to: "authentication#login"
    post "refresh", to: "authentication#refresh"
    resources :establishment_categories, only: [:index, :create, :update, :destroy]
    resources :properties, only: [:index, :create, :update, :destroy] do
      collection do
        get "search", to: "properties#search"
      end
      resources :neighborhoods, only: [:index, :create, :update, :destroy] do
        resources :establishments, only: [:index, :create, :update, :destroy]
      end
    end
  end
end
