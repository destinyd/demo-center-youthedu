{ Table, Button, Popconfirm, Icon } = antd

module.exports = YouthLiveIndexRecords = React.createClass
  render: ->
    # dataSource = [
    #   {
    #     key: '1'
    #     name: '视频一'
    #     length: '12:22'
    #   }
    #   {
    #     key: '2'
    #     name: '视频二'
    #     length: '12:22'
    #   }
    #   {
    #     key: '3'
    #     name: '视频三'
    #     length: '12:22'
    #   }
    # ]

    # 数据包装参考
    # http://help.lecloud.com/Wiki.jsp?page=PlayInterfaceDocument
    console.log @props.saved_video

    dataSource = @props.saved_video.rows.map (x)=>
      key: x.videoId
      name: x.videoName
      length: x.videoDuration
      play_url: "http://yuntv.letv.com/bcloud.html?uu=#{@props.saved_video.uu}&vu=#{x.videoUnique}"
      cover_url: x.video_info?.data?.img
      status: x.status

    columns = [
      {
        title: ''
        key: 'cover'
        width: 150
        render: (x)->
          <div>
            <div style={background: "url(#{x.cover_url})", width: 120, height: 90}></div>
          </div>
      }
      {
        title: '信息'
        key: 'info'
        render: (x)->
          <div>
            <div>名称：{x.name}</div>
            <div>时长：{x.length}</div>
          </div>
      }
      {
        title: '状态'
        key: 'status'
        render: (x)->
          # 参考
          # http://help.lecloud.com/Wiki.jsp?page=SearchResultnew
          switch x.status
            when 1 then <span>新建</span>
            when 5 then <span>新建</span>
            when 2 then <span>执行中</span>
            when 4 then <span>不录制</span>
            when 3 then <span>录制完成</span>
            when 6 then <span>录制失败</span>
            when 7 then <span>转码完成</span>
            when 8 then <span>转码失败</span>
      }
      {
        title: '播放'
        key: 'play'
        render: (x)->
          <a href={x.play_url} target='_blank'>
            <Icon type='play-circle-o' /> 播放
          </a>
      }
    ]

    <Table 
      columns={columns} 
      dataSource={dataSource} 
    />