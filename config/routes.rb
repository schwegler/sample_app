SampleApp::Application.routes.draw do
  root 'home#index'

  devise_for :users

  resources :collections
  resources :comics
  resources :tv_shows
  resources :wrestling_events
  resources :movies
  resources :albums
end
