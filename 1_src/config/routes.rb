Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root "home#index"
  resources :projects

  # Defines the root path route ("/")
  root "articles#index"
  resources :articles
  get 'articles/searchByType/:type', to: 'articles#listSelect'
end
