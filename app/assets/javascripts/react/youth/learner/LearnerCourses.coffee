{ Table, Switch, Icon, Calendar } = antd
{ PageTitle } = Layout

module.exports = LearnerCourses = React.createClass
  getInitialState: ->
    show_calendar: true

  render: ->
    <div>
      <div style={overflow: 'hidden'}>
        <div style={float: 'left'}>
          <PageTitle>课程安排</PageTitle>
        </div>

        <CalendarToggle show_calendar={@state.show_calendar} toggle={@toggle} />
      </div>

      {
        if @state.show_calendar
          <DataCalendar />
        else
          <DataTable />
      }

    </div>

  toggle: (checked)->
    @setState show_calendar: checked



CalendarToggle = React.createClass
  render: ->
    style = 
      float: 'left'
      marginLeft: '2rem'

    style_span =
      float: 'left'
      lineHeight: '32px'
      marginRight: '0.5rem'

    <div style={style}>
      <span style={style_span}>显示日历</span>
      <Switch style={marginTop: '5px'} 
        defaultChecked={@props.show_calendar} 
        onChange={@props.toggle} 
        checkedChildren={<Icon type='calendar' />}
      />
    </div>

DataTable = React.createClass
  render: ->
    dataSource = [{}, {}, {}, {}, {}, {}, {}]

    columns = [
      {
        title: '名称'
        dataIndex: 'name'
        key: 'name'
        render: -> '随便写'
      }
      {
        title: '教师'
        dataIndex: 'teacher'
        key: 'teacher'
        render: -> '随便写'
      }
      {
        title: '学员'
        dataIndex: 'learner'
        key: 'learner'
        render: -> '随便写'
      }
      {
        title: '时间安排'
        dataIndex: 'time'
        key: 'time'
        render: -> '2016-08-11 01:18 -- 2016-08-11 03:18'
      }
      {
        title: '类型'
        dataIndex: 'kind' # 直播课，点播课，线下课
        key: 'kind'
        render: -> '随便写'
      }
      {
        title: '状态'
        dataIndex: 'status'
        key: 'status'
        render: -> '随便写'
      }
      {
        title: '操作'
        dataIndex: 'ops'
        key: 'ops'
        render: ->
          <div>
            <a href='javascript:;'>看课件</a>
          </div>
      }
    ]
    
    <Table 
      columns={columns} 
      dataSource={dataSource} 
    />


DataCalendar = React.createClass
  render: ->
    <Calendar dateCellRender={@dateCellRender} />

  dateCellRender: ->
    <a href='/youth/live'>链接文字</a>