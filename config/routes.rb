Rails.application.routes.draw do
  
  root 'houses#index'
  resources :houses do
    resources :projects, only: [:index, :new]
  end

  resources :areas

  resources :projects do
    resources :items, only: [:index]
  end

  resources :materials do
    collection do
      delete'remove_multiple_materials' => 'materials#remove_multiple'
    end
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
