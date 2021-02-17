Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :friends, only: [:index, :show, :new, :create, :edit, :update] do
    resources :bookings, only: [:index, :new, :create]
  end
  resources :bookings, only: [] do
    member { patch 'accepted' }
    member { patch 'denied' }
    member { patch 'canceled' }
    member { patch 'archived' }
  end
  get 'dashboard', to: 'pages#dashboard', as: :dashboard
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
