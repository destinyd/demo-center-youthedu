Rails.application.routes.draw do
  root to: 'index#index'

  namespace :youth do
    get '/live',         to: 'live#index'
    get '/live/room',    to: 'live#room'
    get '/live/new',     to: 'live#new'
    get '/live/records', to: 'live#records'


    get '/consultant/learners',       to: 'live#consultant_learners'
    get '/consultant/learners/edit',  to: 'live#consultant_edit_learner'

    get '/manager/learners',            to: 'live#manager_learners'
    get '/manager/learners/edit',       to: 'live#manager_edit_learner'
    get '/manager/initial_assessment',  to: 'live#nothing'
    get '/manager/schedule',            to: 'live#manager_schedule'

    get '/learner/courses',             to: 'live#learner_courses'
    get '/learner/info',                to: 'live#learner_info'

    get '/teacher/courses',             to: 'live#teacher_courses'
  end
  
  resources :live_items do
    #方便调试用Get，实际开发改成Post
    get "create_live", on: :collection
    get "video_info_list", on: :collection
  end
end
