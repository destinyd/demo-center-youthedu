Rails.application.routes.draw do
  root to: 'index#index'

  namespace :youth do
    get '/live', to: 'live#index'
    get '/live/room', to: 'live#room'
    get '/live/new', to: 'live#new'
  end
end
