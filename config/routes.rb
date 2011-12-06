WeatherOnRails::Application.routes.draw do
  resources :locations
  resources :noaa_locations do
    resources :noaa_forcasts
  end
  match '/locations/create' => 'locations#create'
  
  root :to => 'home#index'
end
