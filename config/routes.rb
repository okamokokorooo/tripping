Rails.application.routes.draw do
  resources :comments
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations"}
  root 'genres#index'
  resources :users
  resources :genres do
    resources :programs do
      resources :programs, only: :index, defaults: { format: "json"}
      resources :likes, only: [:create, :destroy]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
