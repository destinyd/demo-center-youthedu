{ Table, Button, Popconfirm, Icon } = antd

module.exports = YouthLiveIndexRecords = React.createClass
  render: ->
    dataSource = [
      {
        key: '1'
        name: '视频一'
        length: '12:22'
      }
      {
        key: '2'
        name: '视频二'
        length: '12:22'
      }
      {
        key: '3'
        name: '视频三'
        length: '12:22'
      }
    ]

    columns = [
      {
        title: ''
        key: 'cover'
        width: 150
        render: ->
          <div>
            <div style={background: 'url(http://i.teamkn.com/i/XQwJKwii.png)', width: 120, height: 90}></div>
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
        title: '播放'
        key: 'play'
        render: ->
          <a href='http://yuntv.letv.com/bcloud.html?uu=0f6e8bd118&vu=769a952681' target='_blank'>
            <Icon type='play-circle-o' /> 播放
          </a>
      }
    ]

    <Table 
      columns={columns} 
      dataSource={dataSource} 
    />