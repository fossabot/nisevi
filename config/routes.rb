Rails.application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"},
    controllers: {
      omniauth_callbacks: "users/omniauth_callbacks",
      registrations: "users/registrations"
    }

  resource :user, only: [:edit] do
    collection do
      patch 'update_password'
    end
  end

  resources :portfolios, only: [:index]

  resources :articles do
    resources :comments
  end

  resources :welcome, path: :contact, only: [:index, :create]

  resources :management_console, only: [:index]

  root "welcome#index"
end
