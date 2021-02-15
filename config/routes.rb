Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :friends, only: [:index, :show, :new, :create, :edit, :update] do
    ressources :bookings, only: [:new, :create] do 
      member do 
        patch 'accepted'
        patch 'denied'
      end
    end
  end


  get 'dashboard', to: 'pages#dashboard', as: :dashboard




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
