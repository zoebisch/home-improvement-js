Rails.application.routes.draw do
  root 'houses#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}
  resources :items

  resources :materials do
    collection do
      delete'remove_multiple_materials' => 'materials#remove_multiple'
    end
  end

  resources :projects do
    resources :items, only: [:index]
  end

  resources :areas

  resources :houses do
    resources :projects, only: [:index, :new]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
