Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root 'timelines#index'
  post 'timelines', to: 'timelines#create'
  resources :users, only: [:show] do
    resource :follows, only: [:create, :destroy]
  end
end