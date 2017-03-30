Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  put "/put", to: "spaces#put", as: "put"

  root 'users#index'

  resources :destinations

  post "/spaces/:id" => "spaces#transfer"
  resources :spaces

  get "/walking", to: "users#walking", as: "walking"

  get "/walking-update", to: "users#walking_update", as: "walking_update"
 
  get "/arrived", to: "users#index", as: "arrived"

  get "/arrived-update", to: "users#arrived_update", as: "arrived_update"

end
