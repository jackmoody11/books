Rails.application.routes.draw do

  devise_for :users
  resources :listings
  resources :users
  resources :categories
  resources :courses
  root 'pages#home'
  get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"
  get "/terms", to: "pages#terms"
  get "/privacy", to: "pages#privacy"

    devise_scope :user do
      get 'login', to: 'devise/sessions#new'
      post 'login', to: 'devise/sessions#create'
      delete 'logout', to: 'devise/sessions#destroy'
      get 'signup', to: 'devise/registrations#new'
    end


end
