Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'aboutus', to: "aboutus#aboutus"
  get 'contactus', to: "contactus#contactus"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :dogs, only: [:index, :show, :create, :new, :update, :edit] do
    resources :availabilities, only: [:index, :show, :create, :new]
    resources :bookings, only: [:show, :create, :new, :update]
  end
  resources :bookings, only: [:index, :destroy]
  resources :reviews, only: [:index, :show, :create, :new]

  get 'dashboard', to: "pages#dashboard", as: :dashboard
end
