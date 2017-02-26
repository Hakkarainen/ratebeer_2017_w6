Rails.application.routes.draw do
  resources :styles
  resources :memberships
  resources :beer_clubs
  resources :beers
  resources :breweries
  resources :ratings, only: [:index, :new, :create, :destroy]

  resource :sessions, only: [:new, :create, :destroy]
   get 'signup', to: 'users#new'
   get 'signin', to: 'sessions#new'
  get 'signout', to: 'sessions#destroy'
  post 'signin', to: 'sessions#new'
  post 'create', to: 'sessions#create'
  post 'signout', to: 'sessions#destroy'

  root 'breweries#index'
  resources :places, only:[:index, :show]
  post 'places', to:'places#search'

  resources :breweries do
    post 'toggle_activity', on: :member
  end

  resources :users do
    post 'block', on: :member
  end
  end