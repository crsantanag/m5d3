Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "pages#index"

  get  "movies" => "movies#option"
  get  "movies/index"
  get  "movies/new"
  get  "movies/create"
  post "movies" => "movies#create"
  get  "movies/show"

  get  "series" => "series#option"
  get  "series/index"
  get  "series/new"
  get  "series/create"
  post "series" => "series#create"
  get  "series/show"

  get  "documentaries"  => "documentaries#option"
  get  "documentaries/index"
  get  "documentaries/new"
  get  "documentaries/create"
  post "documentaries" => "documentaries#create"
  get  "documentaries/show"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
