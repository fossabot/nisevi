Rails.application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"},
    controllers: {omniauth_callbacks: "omniauth_callbacks"}

  resources :articles do
    resources :comments
  end

  root "welcome#index"
end
