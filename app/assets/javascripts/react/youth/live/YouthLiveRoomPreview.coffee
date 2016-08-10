{ Table, Icon } = antd

module.exports = YouthLiveRoomPreview = React.createClass
  render: ->
    # dataSource = [
    #   {
    #     key: '1'
    #     field: '直播间名称'
    #     value: '演示直播间一'
    #   }
    #   {
    #     key: '2'
    #     field: '推流地址'
    #     value: 'http://xxxxxxxxxxxxxx'
    #   }
    #   {
    #     key: '3'
    #     field: '推流码'
    #     value: 'xxxxxxxxxxxxxxxxxxxxx'
    #   }
    # ]

    # columns = [
    #   {
    #     title: '名称'
    #     dataIndex: 'field'
    #     key: 'field'
    #   }
    #   {
    #     title: '值'
    #     dataIndex: 'value'
    #     key: 'value'
    #   }
    # ]

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
          <span>演示直播间一</span>
        </div>
        <div>
          <label style={label_style}>推流地址：</label>
          <span>http://xxxxxxxxxxxxxx</span>
        </div>
        <div>
          <label style={label_style}>推流码：</label>
          <span>xxxxxxxxxxxxxxxxxxxxx</span>
        </div>
        <div>
          <label style={label_style}>信号状态：</label>
          <span>有信号</span>
        </div>
        <div>
          <label style={label_style}>直播地址：</label>
          <span>http://......</span>
        </div>
      </div>

      <div className='preview' style={preview_style}>
        <Icon type='play-circle' style={color: '#2DB7F5', fontSize: 60, position: 'absolute', top: 0, left: 0, right: 0, bottom: 0, margin: 'auto', width: 100, height: 100, lineHeight: '100px'} />
      </div>
    </div>


# <div id="player" style="width:100%;height:450px;">
#     <script type="text/javascript" charset="utf-8" src="http://yuntv.letv.com/player/live/blive.js"></script>
#     <script>
#         var player = new CloudLivePlayer();
#         player.init({activityId:"A20160810000013i"});
#     </script>
# </div>