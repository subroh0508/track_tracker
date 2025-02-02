Rails.application.routes.draw do
  if Rails.env.development?
    mount Lookbook::Engine, at: "/lookbook"
  end

  resources :albums, only: %i[index show] do
    member do
      get :player
    end
  end

  get "streaming_tracks/register", to: "streaming_tracks#index"
  get "streaming_tracks/register/:brand/:type/search", to: "streaming_tracks#search"
  post "streaming_tracks/register/:brand/:type", to: "streaming_tracks#register"
  post "streaming_tracks/register/:brand/:type/:target_id", to: "streaming_tracks#link"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
