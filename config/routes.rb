Rails.application.routes.draw do
  root to: 'index#index'

  namespace :youth do
    get '/live',         to: 'live#index'
    get '/live/room',    to: 'live#room'
    get '/live/new',     to: 'live#new'
    get '/live/records', to: 'live#records'


    get '/consultant/learners',       to: 'live#nothing'
    get '/consultant/learners/edit',  to: 'live#nothing'
    get '/manager/learners',          to: 'live#nothing'
    get '/manager/learners/edit',     to: 'live#nothing'
    get '/learner/courses',           to: 'live#nothing'
    get '/learner/info',              to: 'live#nothing'
    get '/teacher/schedule',          to: 'live#nothing'
  end
  
  resources :live_items do
    #方便调试用Get，实际开发改成Post
    get "create_live", on: :collection
    get "video_info_list", on: :collection
  end
end
