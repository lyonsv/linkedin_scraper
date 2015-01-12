Rails.application.routes.draw do
  root to: 'visitors#index'  
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, controllers: {omniauth_callbacks: "users/omniauth_callbacks", registrations: "users/registrations"}
  resources :users
end
