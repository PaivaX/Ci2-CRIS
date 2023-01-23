Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root "home#index"
  resources :projects
  
  namespace :admin do
    get '/', to: 'admin#index'
    resources :users
  end
end
