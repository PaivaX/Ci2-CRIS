Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root "home#index"
  resources :projects
  resources :researchers
  resources :institutions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    get '/', to: 'admin#index'
    resources :users
    post '/users/:id/block-unblock', to: 'users#block_unblock', as: 'block_unblock_user'
  end

  resources :contacts, only: [:new, :create]
  get '/contacts', to: 'contacts#new', as: 'contact'
  get 'contacts/sent'

  # Defines the root path route ("/")

  resources :articles
  get 'articles/searchByType/:type', to: 'articles#listSelect'
end
