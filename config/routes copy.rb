Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "pages#index"

  # Menú películas
  get    "movies" => "movies#option"

  # Listar películas
  get    "movies/index"

  # Crear película
  get    "movies/new"
  get    "movies/create"
  post   "movies",           to:   "movies#create"

  # Actualizar película
  get    "movies/show",       to: "movies#show",   as: "show_movies"
  get    "movies/:id/edit",   to: "movies#edit",   as: "edit_movies"
  patch  "movies/:id",        to: "movies#update", as: ""

  # Eliminar película
  get    "movies/remove"       => "movies#remove", as: "remove_movies"
  post   "movies/remove",     to: "movies#destroy_by_id"
  delete "movies/:id",        to: "movies#destoy"
  get    "movies/string"
  get    "movies/display"
  get    "movies/noexiste"

  get  "series" => "series#option"
  get  "series/index"
  get  "series/new"
  get  "series/create"
  post "series" => "series#create"
  get  "series/show"
  get  "series/search"

  get  "documentaries"  => "documentaries#option"
  get  "documentaries/index"
  get  "documentaries/new"
  get  "documentaries/create"
  post "documentaries" => "documentaries#create"
  get  "documentaries/show"
  get  "documentaries/search"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
