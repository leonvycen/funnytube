# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[new create] do
    get 'videos', on: :member
  end

  resources :share_videos, only: %i[new create]
  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'signout', to: 'sessions#signout'
  get 'signup', to: 'users#new'
  root to: 'main#home'
end
