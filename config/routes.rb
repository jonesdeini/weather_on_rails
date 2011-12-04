WeatherOnRails::Application.routes.draw do
  resources :locations
  resources :noaa_locations
  match '/locations/create' => 'locations#create'

  root :to => 'home#index'
end
