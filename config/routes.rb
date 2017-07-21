Rails.application.routes.draw do
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

  get '/recordings', to: 'pages#maintenance'
  get '/recordings/*uri', to: 'pages#maintenance'
  get '/store', to: 'pages#maintenance'
  get '/store/*uri', to: 'pages#maintenance'
  get '/otherstuff', to: 'pages#maintenance'
  get '/calendar', to: 'pages#maintenance'
  get '/news', to: 'pages#maintenance'
end
