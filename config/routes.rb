Rails.application.routes.draw do
  root to: 'index#index'

  namespace :youth do
    get '/live', to: 'live#index'
    get '/live/room', to: 'live#room'
    get '/live/new', to: 'live#new'
  end
  
  resources :live_items do
    get "create_live", on: :collection
  end
end
