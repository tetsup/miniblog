Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root 'timelines#index'
  resources :timelines, only: [:index, :create] do
    resource :favorites, only: [:create, :destroy]
    collection do
      get 'following'
    end
  end
  resources :users, only: [:show] do
    resource :follows, only: [:create, :destroy]
  end
end