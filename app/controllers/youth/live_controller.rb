class Youth::LiveController < ApplicationController
  layout 'youth'

  def index
    items = LiveItem.all.desc(:id).map { |item|
      {
        key: item.id.to_s,
        name: item.title,
        start: item.start_time,
        end: item.end_time,
        active_status: item.active_status,
        signal: item.has_singal?
      }
    }

    @component_name = 'YouthLiveIndexPage'
    @component_data = {
      rooms: items
    }
  end

  def room
    if params[:id].blank?
      live = LiveItem.last
    else
      live = LiveItem.find(params[:id])
    end

    request_data = live.get_obs_url_and_code

    data = {
      name:         live.title,
      live_id:      live.live_id,
      activity_id:  live.activity_id,

      obs_url:  request_data[:obs_url],
      obs_code: request_data[:obs_code],
      signal:   live.has_singal?,
      play_url: live.get_play_url,
    }

    @menukey = '/youth/live/room'
    @component_name = 'YouthLiveRoomPreview'
    @component_data = {
      room: data
    }
  end

  def new
    @component_name = 'YouthLiveNew'
  end

  def records
    @component_name = 'YouthLiveRecords'
  end

  # -------------

  def consultant_learners
    @component_name = 'ConsultantLearners'
  end

  def consultant_edit_learner
    @component_name = 'ConsultantEditLearner'
  end

  def manager_learners
    @component_name = 'ManagerLearners'
  end

  def manager_edit_learner
    @component_name = 'ConsultantEditLearner'
  end

  def manager_schedule
    @component_name = 'ManagerSchedule'
  end

  def learner_courses
    @component_name = 'LearnerCourses'
  end

  def learner_info
    @component_name = 'LearnerInfo'
  end

  def teacher_courses
    @component_name = 'TeacherCourses'
  end

  def nothing
    @component_name = 'Nothing'
  end

end