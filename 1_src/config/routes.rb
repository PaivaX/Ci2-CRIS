Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root "home#index"
  resources :projects
  get '/projects/filter/:project_role', to: 'projects#filter', as: 'filter_projects'

  resources :researchers
  resources :institutions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :contacts, only: [:new, :create]
  get '/contacts', to: 'contacts#new', as: 'contact'
  get 'contacts/sent'

  resources :vacancies

  resources :vacancies

 
  namespace :admin do
    get '/', to: 'admin#index'
    resources :users
    post '/users/:id/block-unblock', to: 'users#block_unblock', as: 'block_unblock_user'
  end

  # Defines the root path route ("/")

  resources :articles
  get 'articles/searchByType/:type', to: 'articles#listSelect'

  get '/tagged', to: "articles#tagged", as: :tagged
end
