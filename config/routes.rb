Rails.application.routes.draw do
  resources :comments
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations"}
  root 'genres#index'
  resources :genres
  resources :genres do
    resources :programs do
      resources :comments
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
