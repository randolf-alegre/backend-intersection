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
    resources :establishment_categories, only: [ :index, :create, :update, :destroy ]
    resources :neighborhoods, only: [ :create, :update, :destroy ] do
      collection do
        get :all
        post "associate_properties", to: "neighborhoods#associate_properties"
        post "associate_establishments", to: "neighborhoods#associate_establishments"
      end
    end
    resources :establishments, only: [ :create, :update, :destroy ] do
      collection do
        get :all
      end
    end
    resources :properties, only: [ :index, :create, :update, :destroy ] do
      collection do
        get "search", to: "properties#search"
        post "associate_neighborhoods", to: "properties#associate_neighborhoods"
      end
      resources :neighborhoods, only: [ :index ] do
        resources :establishments, only: [ :index ]
      end
    end
  end
end
