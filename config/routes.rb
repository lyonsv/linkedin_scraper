Rails.application.routes.draw do
  resources :educations
  resources :contacts
  root to: 'contacts#index'  
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, controllers: {omniauth_callbacks: "users/omniauth_callbacks", registrations: "users/registrations"}
  resources :users
end
