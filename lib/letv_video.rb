require 'digest/md5'
require 'uri'
require 'net/http'
require 'net/https'
require 'json'  

class LetvVideo
  class << self
    def set_userid(str)
      @@userid = str
    end

    def set_secretkey(str)
      @@secretkey = str
    end

    def set_uu(str)
      @@uu = str
    end

    def make_sign_str(hash)
      Digest::MD5.hexdigest(hash.sort_by{|k, v| k}.map{|k, v| k.to_s + v.to_s}.join() + @@secretkey)
    end

    def time_to_hours(time)
      [time/60/60,(time/60)%60].join(":")
    end

    def get_video_info(video_id)
      params = {
        :user_unique => @@uu,
        :timestamp => Time.now.to_i * 1000,
        :api => "video.get",
        :format => "json",
        :ver => "2.0",
        :video_id => video_id.to_i
      }

      params[:sign] = make_sign_str(params)

      url = URI.parse("http://api.letvcloud.com/open.php")
      return_hash = {}

      Net::HTTP.start(url.host, url.port) do |http|
        req = Net::HTTP::Post.new(url.path)
        req.set_form_data(params)
        response = JSON.parse(http.request(req).body)
        if response["code"] != 0
          false
        else
          return_hash[:video_name] = response["data"]["video_name"]
          return_hash[:img_url] = response["data"]["img"]
          time = response["data"]["video_duration"].to_i
          return_hash[:video_duration] = time_to_hours(time)
        end
      end
      return_hash
    end
  end
end

# 初始化设置类变量
LetvVideo.set_userid("857550")
LetvVideo.set_secretkey("ed854df4e84e891fc838cb09be9a5039")
LetvVideo.set_uu("zumwnd31gk")