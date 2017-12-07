Rails.application.routes.draw do
  resources :items
  resources :materials
  resources :projects
  resources :areas
  resources :houses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
