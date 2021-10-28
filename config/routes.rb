Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'timelines#index'
  post 'timelines', to: 'timelines#create'
end
