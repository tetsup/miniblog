Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root 'timelines#index'
  post 'timelines', to: 'timelines#create'
  resources :users, only: [:show, :index]
  resources :follows, only: [:create]
  delete 'follows', to: 'follows#destroy'
end
