Rails.application.routes.draw do
  resources :instruments

  resource :order, only: [:show, :update]
  resources :order_items

  get 'categories/index'

  get 'albums/songs'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'landing#index'

  get '/performance', to: 'pages#performance'
  get '/press',       to: 'pages#press'
  get '/contact',     to: 'messages#new'
  get '/press',       to: 'pages#press'
  get '/bio',         to: 'pages#bio'

  # Performances
  get '/performance/assemblies', to: 'pages#assemblies'
  get '/performance/residencies', to: 'pages#residencies'
  get '/performance/preschool', to: 'pages#preschool'
  get '/performance/church', to: 'pages#church'
  get '/performance/library', to: 'pages#library'
  get '/performance/concerts', to: 'pages#concerts'
  get '/performance/chris-and-jack', to: 'pages#chris_jack'

  resources :messages, only: [:new, :create]
  resources :albums, only: [:show] do
    resources :songs, only: [:show]
  end

  get '/recordings', to: 'categories#index'
  get '/recordings/*uri', to: 'pages#album_redirect'
  get '/store/product/*uri', to: 'pages#instrument_redirect'
  get '/otherstuff', to: 'pages#otherstuff'
  get '/store/*uri', to: 'pages#maintenance'
  get '/calendar', to: 'pages#maintenance'
  get '/news', to: 'news_items#index'

  # Store
  # get '/store', to: 'pages#maintenance'
  get '/store', to: 'store#index'
end
