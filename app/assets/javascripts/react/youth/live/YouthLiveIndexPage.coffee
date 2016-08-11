{ Table, Button, Popconfirm } = antd

module.exports = YouthLiveIndexPage = React.createClass
  render: ->
    dataSource = @props.rooms

    # dataSource = [
    #   {
    #     key: '1'
    #     name: '演示直播间一'
    #     start: new Date('2016-08-09 12:40')
    #     end: new Date('2016-08-09 14:40')
    #     active: true
    #     signal: true
    #   }
    #   {
    #     key: '2'
    #     name: '演示直播间二'
    #     start: new Date('2016-07-09 12:40')
    #     end: new Date('2016-07-09 14:40')
    #     active: false
    #     signal: false
    #   }
    #   {
    #     key: '3'
    #     name: '演示直播间三'
    #     start: new Date('2016-07-09 12:40')
    #     end: new Date('2016-07-09 14:40')
    #     active: false
    #     signal: false
    #   }
    # ]

    columns = [
      {
        title: '名称'
        dataIndex: 'name'
        key: 'name'
      }
      {
        title: '起止时间'
        key: 'start_end'
        render: (item)->
          start = new Date(item.start).format('yyyy-MM-dd hh:mm')
          end = new Date(item.end).format('yyyy-MM-dd hh:mm')

          <span>
            <span>{start}</span> -- <span>{end}</span>
          </span>
      }
      {
        title: '直播状态'
        dataIndex: 'active_status'
        key: 'active_status'
        render: (status)->
          switch status
            when 0 
              <span style={color: '#ccc'}>未开始</span>
            when 1
              <span>正在直播</span> 
            when 2
              <span style={color: '#ccc'}>已中断</span>
            when 3
              <span style={color: '#ccc'}>已结束</span>
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
      {
        title: '操作'
        key: 'ops'
        render: (item)=>
          switch item.active_status
            when 0 
              <div />
            when 1
              <div>
                <a href="/youth/live/room/#{item.key}">预览</a>
                <span className='ant-divider' />
                <Popconfirm title="确定要提前结束直播吗？" onConfirm={@finish(item)}>
                  <a href='javascript:;'>提前结束</a>
                </Popconfirm>
              </div>
            when 2
              <div />
            when 3
              <div>
                <a href='/youth/live/records'>录像回放</a>
              </div>
      }
    ]

    <Table 
      columns={columns} 
      dataSource={dataSource} 
      title={@render_title}
    />

  render_title: ->
    <div>
      <Button type='primary' icon='plus' onClick={@open_new}>创建直播间</Button>
    </div>

  open_new: ->
    Turbolinks.visit('/youth/live/new')

  finish: (item)->
    ->
      jQuery.ajax
        url: "/live_items/#{item.key}/finish"
        type: 'DELETE'
      .done (res)->
        location.href = '/youth/live'