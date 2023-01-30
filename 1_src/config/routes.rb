Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root "home#index"
  resources :projects
  resources :institutions
  
  namespace :admin do
    get '/', to: 'admin#index'
    resources :users
    post '/users/:id/block-unblock', to: 'users#block_unblock', as: 'block_unblock_user'
  end

  resources :articles
  get 'articles/searchByType/:type', to: 'articles#listSelect'
end
