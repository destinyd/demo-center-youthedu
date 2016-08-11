class Youth::LiveItemController < ApplicationController
  def index
    datas = LiveItem.all.map.with_index do |live, index|
     {
        :key    => index,
        :name   => live.title,
        :start  => live.start_time.to_s,
        :end    => live.end_time.to_s,
        :active => Time.now > live.start_time && Time.now < live.end_time,
        :signal => live.has_singal?
      }
    end
  end

  def show
    live = LiveItem.find(params[:id])
    datas = {
      :name     => live.title,
      :obs_url  => live.get_obs_url_and_code[:obs_url],
      :obs_code => live.get_obs_url_and_code[:code],
      :signal   => live.has_singal?,
      :play_url => live.get_play_url,
      :live_id  => live.live_id
    }
  end

  def create
    # params格式 {:live => {:start => "2016/08/10 16:33", :end => "2016/08/10 16:39", :title => "math"}}
    params[:live][:start] = Time.parse(params[:live][:start])
    params[:live][:end]   = Time.parse(params[:live][:end])
    if LiveItem.create_live_room(params[:live])
      puts "创建成功"
    else
      puts "创建失败"
    end
  end
end