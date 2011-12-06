WeatherOnRails::Application.routes.draw do
  resources :locations
  resources :noaa_locations, :has_many => :noaa_forcasts
  match '/locations/create' => 'locations#create'

  root :to => 'home#index'
end
