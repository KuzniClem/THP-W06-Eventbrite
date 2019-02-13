# frozen_string_literal: true

Rails.application.routes.draw do
  root 'events#index'
  resources :events, only: [:index, :show, :new, :create] do
    resources :attendances, only: [:index, :new, :create]
  end
  devise_for :users
  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
