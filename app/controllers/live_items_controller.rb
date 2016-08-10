class LiveItemsController < ApplicationController
  def index
    datas = LiveItem.all.to_a.map.with_index do |live, index|
     {
        :key    => index,
        :name   => live.title,
        :start  => live.start_time.to_s,
        :end    => live.end_time.to_s,
        :active => live.active?,
        :signal => live.has_singal?
      }
    end
    puts datas
  end

  def show
    live = LiveItem.find(params[:id])
    datas = {
      :name     => live.title,
      :obs_url  => live.get_obs_url_and_code[:obs_url],
      :obs_code => live.get_obs_url_and_code[:obs_code],
      :signal   => live.has_singal?,
      :play_url => live.get_play_url,
      :live_id  => live.live_id
    }
    puts datas
  end

  def create_live
    # params格式 {:start => "2016/08/10 16:33", :end => "2016/08/10 16:39", :title => "math"}
    params[:start] = Time.parse(params[:start])
    params[:end]   = Time.parse(params[:end])
    if LiveItem.create_live_room(params)
      puts "创建成功"
    else
      puts "创建失败"
    end
  end
end