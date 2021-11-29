Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root 'timelines#index'
  resources :timelines, only: [:index, :show, :create] do
    # destroyの引数を、favorite_idにすると複雑化するため、resourceとresourcesに分離
    resource :favorites, only: [:create, :destroy], module: :timelines
    resources :favorites, only: [:index], module: :timelines
    resources :comments, only: [:create], module: :timelines
    collection do
      get 'following'
    end
  end
  resources :users, only: [:show] do
    resource :follows, only: [:create, :destroy], module: :users
  end
end