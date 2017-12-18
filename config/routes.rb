Rails.application.routes.draw do
  root 'houses#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}
  resources :items
  resources :materials
  resources :projects
  resources :areas
  resources :houses do
    resources :projects, only: [:index, :new]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
