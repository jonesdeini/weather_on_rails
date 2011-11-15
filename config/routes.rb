WeatherOnRails::Application.routes.draw do
  resources :locations

  match '/locations' => 'locations#index'
  match '/locations/new' => 'locations#create'

  root :to => 'home#index'
end
