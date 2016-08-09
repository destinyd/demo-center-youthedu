class Youth::LiveController < ApplicationController
  layout 'youth'

  def index
    @component_name = 'YouthLiveIndexPage'
    @menukey = 'live'
  end

  def room
    @component_name = 'YouthLiveRoomPreview'
    @menukey = 'live-room'
  end
end