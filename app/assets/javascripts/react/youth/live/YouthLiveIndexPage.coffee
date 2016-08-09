{ Table, Button } = antd

module.exports = YouthLiveIndexPage = React.createClass
  render: ->
    dataSource = [
      {
        key: '1'
        name: '直播活动一'
        start: '2016-08-09 12:40'
        end: '2016-08-09 14:40'
        signal: true
      }
      {
        key: '2'
        name: '直播活动二'
        start: '2016-08-09 12:40'
        end: '2016-08-09 14:40'
        signal: false
      }
      {
        key: '3'
        name: '直播活动三'
        start: '2016-08-09 12:40'
        end: '2016-08-09 14:40'
        signal: false
      }
    ]

    columns = [
      {
        title: '名称'
        dataIndex: 'name'
        key: 'name'
      }
      {
        title: '开始时间'
        dataIndex: 'start'
        key: 'start'
      }
      {
        title: '结束时间'
        dataIndex: 'end'
        key: 'end'
      }
      {
        title: '信号状态'
        dataIndex: 'signal'
        key: 'signal'
        render: (value)->
          if value 
          then <span>有信号</span> 
          else <span style={color: '#ccc'}>无信号</span>
      }
    ]

    <Table 
      columns={columns} 
      dataSource={dataSource} 
      bordered
      title={@render_title}
    />

  render_title: ->
    <div>
      <Button type='primary' icon='plus' onClick={@open_new}>创建直播活动</Button>
    </div>

  open_new: ->
    Turbolinks.visit('/youth/live/new')