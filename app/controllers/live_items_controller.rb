class LiveItemsController < ApplicationController
  # def index
  #   datas = LiveItem.all.map.with_index do |live, index|
  #     {
  #       :key    => index,
  #       :name   => live.title,
  #       :start  => live.start_time.to_s,
  #       :end    => live.end_time.to_s,
  #       :active => live.active?,
  #       :signal => live.has_singal?
  #     }
  #   end
  #   puts datas
  # end

  # def show
  #   live = LiveItem.find(params[:id])
  #   datas = {
  #     :name     => live.title,
  #     :obs_url  => live.get_obs_url_and_code[:obs_url],
  #     :obs_code => live.get_obs_url_and_code[:obs_code],
  #     :signal   => live.has_singal?,
  #     :play_url => live.get_play_url,
  #     :live_id  => live.live_id,
  #     :video_id => live.get_saved_video["video_id"]
  #   }
  #   puts datas
  # end

  def create_live
    # params格式 {:start => "2016/08/10 16:33", :end => "2016/08/10 16:39", :title => "math"}
    data = {
      title: params[:title],
      start: Time.parse(params[:start]),
      end: Time.parse(params[:end]),
    }

    if live_item = LiveItem.create_live_room(data)
      render json: live_item
    else
      render json: {}, status: 400
    end
  end

  def video_info_list
    datas = LiveItem.all.to_a.map do |live_item|
      video_info = live_item.get_video_info
      if video_info != false
        video_info
      else
        next
      end
    end
    datas.delete({})
    puts datas
  end

  def finish
    live = LiveItem.find params[:id]
    live.finish!

    render json: live
  end
end