{ Timeline, Icon, Button } = antd

courses = [
  {start: '2016-08-16 19:00', period: '2', name: '示例课程一', type: '直播课', teacher: '王老师'}
  {start: '2016-08-19 19:00', period: '2', name: '示例课程二', type: '线下小班课', teacher: '王老师'}
  {start: '2016-08-21 19:00', period: '2', name: '示例课程三', type: '直播课', teacher: '王老师'}
  {start: '2016-08-23 19:00', period: '2', name: '示例课程四', type: '线下小班课', teacher: '王老师'}
  {start: '2016-08-26 19:00', period: '2', name: '示例课程五', type: '直播课', teacher: '王老师'}
  {start: '2016-08-28 19:00', period: '2', name: '示例课程六', type: '线下小班课', teacher: '王老师'}
]

module.exports = PlanTimeline = React.createClass
  render: ->
    console.log @props.courses

    cs = @props.courses || courses 
    if @props.pending
      cs = cs[0..2]

    <Timeline pending={@props.pending} className='plan-timeline'>
      {
        for course, idx in cs || []
          <Timeline.Item key={idx}>
              <div className='date'>
                <span><FaIcon type='clock-o' /> {course.start}, {course.period} 小时</span>
              </div>
              <div className='course-card'>
                <div className='inner'>
                  <div>　课程名：{course.name}</div>
                  <div>课程类型：{course.type}</div>
                  {
                    if @props.timeline_of == 'teacher'
                      <div>上课学生：{course.learners}</div>
                    else
                      <div>任课老师：{course.teacher}</div>
                  }
                  {
                    if @props.timeline_of == 'teacher' and course.type == '直播课'
                      <div style={marginTop: '0.5rem'}>
                        <Button type='primary'>
                          <a href='/youth/live/new'><FaIcon type='play-circle' /> 开始直播</a>
                        </Button>
                      </div>
                  }
                </div>
              </div>
          </Timeline.Item>
      }
    </Timeline>