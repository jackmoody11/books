Rails.application.routes.draw do
  # Add ActionCable
  mount ActionCable.server => '/cable'

  devise_for :users
  resources :listings do
    # collection do
    #   get :lookup
    # end
  end
  get '/price_lookup', to: 'listings#price_lookup'
  resources :users
  resources :categories
  resources :courses
  resources :personal_messages, only: [:create, :new]
  resources :conversations, only: [:index, :show]
  root 'pages#home'
  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'
  get '/terms', to: 'pages#terms'
  get '/privacy', to: 'pages#privacy'

  resources :notifications do
    collection do
      post :mark_as_read
    end
  end

  # get 'my-search-url', to: 'listings#search', as: 'my_search_url'

    devise_scope :user do
      get 'login', to: 'devise/sessions#new'
      post 'login', to: 'devise/sessions#create'
      delete 'logout', to: 'devise/sessions#destroy'
      get 'signup', to: 'devise/registrations#new'
    end
end
