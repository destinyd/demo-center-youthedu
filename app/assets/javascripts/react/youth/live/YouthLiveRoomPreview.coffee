{ Table, Icon } = antd

module.exports = YouthLiveRoomPreview = React.createClass
  render: ->
    console.log room = @props.room

    label_style =
      float: 'left'
      width: 90
      textAlign: 'right'

    preview_style =
      width: 800
      height: 450
      backgroundColor: '#333'
      position: 'relative'

    <div>
      <h2 style={marginBottom: '3rem'}>直播间预览</h2>

      <div className='room-info' style={marginBottom: '3rem'}>
        <div>
          <label style={label_style}>直播间名称：</label>
          <span>{room.name}</span>
        </div>
        <div>
          <label style={label_style}>推流地址：</label>
          <span>{room.obs_url}</span>
        </div>
        <div>
          <label style={label_style}>推流码：</label>
          <span>{room.obs_code}</span>
        </div>
        <div>
          <label style={label_style}>信号状态：</label>
          {
            if room.signal
            then <span>有信号</span>
            else <span style={color: '#ccc'}>无信号</span>
          }
        </div>
        <div>
          <label style={label_style}>直播地址：</label>
          <span>
            <a href={room.play_url} target='_blank'>{room.play_url}</a>
          </span>
        </div>
        <div>
          <label style={label_style}>直播ID：</label>
          <span>{room.live_id}</span>
        </div>
      </div>

      <div id='player' style={preview_style}/>
    </div>

  componentDidMount: ->
    player = new CloudLivePlayer()
    player.init {
      activityId: @props.room.activity_id
    }, 'player'


# <div id="player" style="width:100%;height:450px;">
#     <script type="text/javascript" charset="utf-8" src="http://yuntv.letv.com/player/live/blive.js"></script>
#     <script>
#         var player = new CloudLivePlayer();
#         player.init({activityId:"A20160810000013i"});
#     </script>
# </div>