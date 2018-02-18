Rails.application.routes.draw do

  root 'houses#index'
  resources :houses do
      resources :projects, only: [:index, :new]
  end


  resources :projects do
    resources :items, only: [:index]
  end
  get 'insufficient_quantity', to: 'projects#insufficient_quantity'

  resources :materials do
    collection do
      delete'remove_multiple_materials' => 'materials#remove_multiple'
    end
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"} do
    resources :users, :only => [:show]
  end

  get '/projects/materials/new' => 'materials#new'
  get '/materials/:id/blah', to: 'materials#blah'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
