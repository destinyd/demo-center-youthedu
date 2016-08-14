{ Table, Switch, Icon, Calendar } = antd
{ PageTitle } = Layout
{ PlanTimeline } = YouthCommon

module.exports = TeacherCourses = React.createClass
  getInitialState: ->
    show_calendar: false

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
          <PlanTimeline courses={courses} timeline_of='teacher' />
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

courses = [
  {start: '2016-08-16 19:00', period: '2', name: '示例课程一', type: '直播课', learners: '张继科'}
  {start: '2016-08-19 19:00', period: '2', name: '示例课程二', type: '线下小班课', learners: '张继科, 孙一峰, 黄旭东'}
  {start: '2016-08-21 19:00', period: '2', name: '示例课程三', type: '直播课', learners: '张继科'}
  {start: '2016-08-23 19:00', period: '2', name: '示例课程四', type: '线下小班课', learners: '张继科, 孙一峰, 黄旭东'}
  {start: '2016-08-26 19:00', period: '2', name: '示例课程五', type: '直播课', learners: '张继科'}
  {start: '2016-08-28 19:00', period: '2', name: '示例课程六', type: '线下小班课', learners: '张继科, 孙一峰, 黄旭东, 傅园慧'}
]

DataCalendar = React.createClass
  render: ->
    <Calendar dateCellRender={@dateCellRender} />

  dateCellRender: (info)->
    date = new Date(info.time)
    date = date.format('yyyy-MM-dd')

    re = <div />

    for course in courses
      if date == new Date(course.start).format('yyyy-MM-dd')
        re = 
          <div>
            <div>{course.name}</div>
            <div>{course.period} 小时</div>
            <div>{course.type}</div>
            <div>{course.teacher}</div>
          </div>

    re