# frozen_string_literal: true

Rails.application.routes.draw do
  resources :portfolios, :services, :articles

  resources :welcome, path: :contact, only: %i[index create]

  root 'welcome#index'
end
