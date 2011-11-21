WeatherOnRails::Application.routes.draw do
  resources :locations
  match '/locations/create' => 'locations#create'

  root :to => 'home#index'
end
