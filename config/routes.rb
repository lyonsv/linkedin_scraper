Rails.application.routes.draw do
  get 'people_search/search'
  get 'tags/:tag', to: 'contacts#index', as: :tag 
  resources :educations
  resources :contacts do
    collection do
      get :tags, as: :tags
    end
  end
  resources :contacts
  root to: 'contacts#index'  
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, controllers: { registrations: "users/registrations", sessions: "users/sessions"}
  resources :users
end
