{ Icon, Timeline } = antd
{ PageTitle } = Layout
{ PlanTimeline } = YouthCommon

module.exports = LearnerInfo = React.createClass
  render: ->
    <div>
      <PageTitle>我的信息</PageTitle>
      <MyInfo />

      <PageTitle>家长信息</PageTitle>
      <ParentsInfo />

      <div style={
        overflow: 'hidden', 
        borderBottom: 'solid 1px #e9e9e9'
        marginBottom: '1.5rem'
      }>
        <DetailCard title='顾问'>
          <div className='avatar' style={
            backgroundImage: 'url(http://i.teamkn.com/i/M4mUaDaT.png?imageMogr2/thumbnail/!240x240)'
            width: 240 / 4
            height: 240 / 4
            float: 'left'
            borderRadius: 4
            backgroundPosition: 'center center'
            backgroundSize: 'cover'
          } />
          <div style={marginLeft: 60 + 16} >
            <div style={marginBottom: '0.5rem'}>姓名：宋亮</div>
            <div style={marginBottom: '0.5rem'}>电话：13811111111</div>
          </div>
        </DetailCard>
        <DetailCard title='管理师'>
          <div className='avatar' style={
            backgroundImage: 'url(http://i.teamkn.com/i/dAMb77sB.png)'
            width: 240 / 4
            height: 240 / 4
            float: 'left'
            borderRadius: 4
            backgroundPosition: 'center center'
            backgroundSize: 'cover'
          } />
          <div style={marginLeft: 60 + 16} >
            <div style={marginBottom: '0.5rem'}>姓名：陈啸峰</div>
            <div style={marginBottom: '0.5rem'}>电话：13800000000</div>
          </div>
        </DetailCard>
      </div>

      <PageTitle>近期课程安排</PageTitle>
      {
        <PlanTimeline pending={
          <a href='/youth/learner/courses'>查看更多</a>
        } />
      }

    </div>

MyInfo = React.createClass
  render: ->
    info_item_style =
      marginBottom: '0.5rem'

    label_style =
      float: 'left'
      width: 90
      textAlign: 'right'

    avatar_style = 
      backgroundImage: 'url(http://i.teamkn.com/i/NsSyTvHZ.png)'
      width: 240 / 2
      height: 240 / 2
      float: 'left'
      borderRadius: 4
      backgroundPosition: 'center center'
      backgroundSize: 'cover'

    <div className='learner-info' style={
      borderBottom: 'solid 1px #e9e9e9'
      paddingBottom: '1.5rem'
      marginBottom: '1.5rem'
      overflow: 'hidden'
    }>
      <div style={avatar_style} />

      <div className='items' style={marginLeft: 240 / 2 + 24}>
        <div style={info_item_style}>
          <label style={label_style}>姓名：</label>
          <span>大雄</span>
        </div>
        <div style={info_item_style}>
          <label style={label_style}>性别：</label>
          <span>男</span>
        </div>
        <div style={info_item_style}>
          <label style={label_style}>年龄：</label>
          <span>11</span>
        </div>
        <div style={info_item_style}>
          <label style={label_style}>注册日期：</label>
          <span>2016-06-06</span>
        </div>
      </div>
    </div>

ParentsInfo = React.createClass
  render: ->
    <div className='parents-info' style={
      borderBottom: 'solid 1px #e9e9e9'
      paddingBottom: '1.5rem'
      marginBottom: '1.5rem'
      overflow: 'hidden'
    }>
      父亲，某某某，13812345678，abc@example.com
    </div>


DetailCard = React.createClass
  render: ->
    style =
      borderRadius: '4px'
      border: 'solid 1px #e9e9e9'
      borderLeft: 'solid 4px #41C4FE'
      marginBottom: '1.5rem'
      marginRight: '1rem'
      fontSize: '16px'
      maxWidth: 320
      minWidth: 320
      float: 'left'
      overflow: 'hidden'

    hstyle =
      borderBottom: 'solid 1px #e9e9e9'
      padding: '1rem'
      backgroundColor: '#F7FBFF'

    <div style={style}>
      <div style={hstyle}>
        <Icon type='user' /> {@props.title}
      </div>
      <div style={padding: '1rem', overflow: 'hidden'}>
        {@props.children}
      </div>
    </div>



