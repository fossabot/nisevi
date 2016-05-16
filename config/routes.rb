Rails.application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"},
    controllers: {omniauth_callbacks: "omniauth_callbacks"}

  resource :user, only: [:edit] do
    collection do
      patch 'update_password'
    end
  end

  resources :articles do
    resources :comments
  end

  root "welcome#index"
end
