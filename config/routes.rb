Rails.application.routes.draw do
  root "people#index"
  resources :beers
  resources :vehicles
  resources :planets
  resources :people
  get "/pages/:page" => "pages#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'search', to: 'people#search', as: 'search'
end
