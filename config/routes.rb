Rails.application.routes.draw do
  #get 'people_search/search' 
  get 'people_search/search'
  get 'tags/:tag', to: 'contacts#index', as: :tag
  resources :educations
  resources :contacts do
    collection do
      get :tags, as: :tags
    end
    collection do
      get :create_connections_from_linkedin
    end
  end
  resources :contacts
  root to: 'contacts#index'  
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, controllers: { registrations: "users/registrations", sessions: "users/sessions", omniauth_callbacks: "users/omniauth_callbacks"}
  resources :users
end
