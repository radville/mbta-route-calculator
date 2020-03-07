Rails.application.routes.draw do
  resources :routes, only: [:index]

  root to: "application#index"

  get 'search' => "stops#calculate"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
