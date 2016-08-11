class Youth::LiveController < ApplicationController
  layout 'youth'

  def index
    @component_name = 'YouthLiveIndexPage'
  end

  def room
    @component_name = 'YouthLiveRoomPreview'
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