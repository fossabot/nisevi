# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :portfolios, :services

  resources :articles do
    resources :comments
  end

  resources :welcome, path: :contact, only: %i[index create]

  root 'welcome#index'
end
