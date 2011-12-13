WeatherOnRails::Application.routes.draw do
  resources :locations
  resources :noaa_locations do
    resources :noaa_forcasts
  end
  match "*path" => 'error#handle404'
  
  root :to => 'home#index'
end
