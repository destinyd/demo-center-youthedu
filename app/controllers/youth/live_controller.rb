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

  def nothing
    @component_name = 'Nothing'
  end
end