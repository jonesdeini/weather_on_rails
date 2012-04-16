WeatherOnRails::Application.routes.draw do
  match "/cat_facts", :to => "cat_facts#index"
  resources :victims
  resources :players
  resources :locations
  resources :noaa_locations do
    resources :noaa_forcasts
  end
  match "*path" => 'error#handle404' 
  root :to => 'home#index'
end
