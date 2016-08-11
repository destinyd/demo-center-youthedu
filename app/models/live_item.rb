require './lib/letv_live_room'
require './lib/letv_video' 

class LiveItem
  include Mongoid::Document
  include Mongoid::Timestamps

  field :activity_id, :type => String
  field :live_id,     :type => String
  field :title,       :type => String
  field :video_id,    :type => String
  field :start_time,  :type => Time
  field :end_time,    :type => Time
   
  class << self
    def create_live_room(hash)
      activity_id = LetvLiveRoom.create(hash)
      if activity_id.present?
        LiveItem.create(
          :activity_id => activity_id,
          :start_time  => hash[:start],
          :end_time    => hash[:end],
          :title       => hash[:title]
        )
      else
        nil
      end
    end
  end

  def get_obs_url_and_code
    LetvLiveRoom.get_obs_url_and_code(self.activity_id)
  end

  def has_singal?
    hash = LetvLiveRoom.has_singal?(self.activity_id)
    if self.live_id.nil?
      self.live_id = hash[:live_id]
      self.save
    end
    hash[:has_singal]
  end

  def get_play_url
    LetvLiveRoom.get_play_url(self.activity_id)
  end

  def get_saved_video
    if self.live_id.nil?
      has_singal?(self.activity_id)
    end
    saved_video_info = LetvLiveRoom.get_saved_video(self.live_id)
    self.video_id = saved_video_info[:video_id]
    self.save
    saved_video_info
  end

  def finish!
    LetvLiveRoom.finish!(self.activity_id)
    self.is_active = false
    self.save
  end

  def active?
    # 改成从 API 获取
    now = Time.now
    if now >= self.start_time
      now <= self.end_time ? "正在直播" : "已结束" 
    else
      "待开始"
    end
  end

  def get_video_info
    if self.video_id.nil?
      self.get_saved_video
    end
    video_info = LetvVideo.get_video_info(self.video_id)
    if video_info != false
      video_info
    else
      false
    end
  end
end
