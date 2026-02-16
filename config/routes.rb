# frozen_string_literal: true

SampleApp::Application.routes.draw do
  root 'users#index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users

  resources :comics
  resources :tv_shows
  resources :wrestling_events
  resources :movies
  resources :albums
end
