Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get '/' => "users#index"
  put "/put", to: "spaces#put", as: "put"

  root 'home#index'

  resources :destinations
  resources :spaces
  # resources :spaces, { :except => [:show, :new, :index] }

  # patch "/spaces", to: "spaces#show"


end
