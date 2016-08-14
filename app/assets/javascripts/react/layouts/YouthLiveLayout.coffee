{ Menu, Icon, Breadcrumb, Alert} = antd
{ SubMenu } = Menu

module.exports = YouthLiveLayout = React.createClass
  getInitialState: ->
    collapse: false

  change_collapse: ->
    @setState collapse: not @state.collapse
  
  render: ->
    breadcrumb = 
      <div className='ant-layout-breadcrumb'>
        <Breadcrumb>
          <Breadcrumb.Item><Icon type='home' /> 青少年培训</Breadcrumb.Item>
          <Breadcrumb.Item>直播</Breadcrumb.Item>
        </Breadcrumb>
      </div>

    classes = ClassName
      'ant-layout-aside': true
      'ant-layout-aside-collapse': @state.collapse

    <div className={classes}>
      <Aside 
        slides={@props.slides}
        collapse={@state.collapse} 
        change_collapse={@change_collapse}
        menukey={@props.menukey}
      />

      <div className="ant-layout-main">
        {breadcrumb}

        <div className="ant-layout-container">
          <div className="ant-layout-content" style={maxWidth: 1200}>
            <YieldComponent component={@props.content_component} />
          </div>
        </div>
        <div className="ant-layout-footer">
          Powered by Knowledge Camp
        </div>
      </div>

    </div>


Aside = React.createClass
  getInitialState: ->
    selected_key: @props.menukey

  render: ->
    aside_action =
      <div className='ant-aside-action' onClick={@props.change_collapse}>
        <Icon type={if @props.collapse then 'right' else 'left'} />
      </div>

    <aside className='ant-layout-sider'>
      <Menu 
        mode='inline' 
        theme='dark' 
        defaultOpenKeys={menudata.map (x)-> x.subkey}
        defaultSelectedKeys={[@state.selected_key]}
      >
        {
          for sub in menudata
            <SubMenu key={sub.subkey} title={<span><Icon type={sub.subicon} /> {sub.subname}</span>}>
            {
              for menu in sub.menus
                <Menu.Item key={menu.href}>
                  <Link href={menu.href} icon={menu.icon}>{menu.name}</Link>
                </Menu.Item>
            }
            </SubMenu>
        }
      </Menu>

      {aside_action}
    </aside>


Link = React.createClass
  render: ->
    {href, icon} = @props

    <a href={@props.href} onClick={@click}>
      <span className='nav-text'>{@props.children}</span>
    </a>

  click: (evt)->
    evt.preventDefault()
    evt.stopPropagation()
    Turbolinks.visit @props.href



menudata = [
  {
    subkey: 'sub-live'
    subicon: 'video-camera'
    subname: '直播'
    menus: [
      {href: '/youth/live',         icon: 'bars',          name: '直播间列表'}
      {href: '/youth/live/new',     icon: 'plus',          name: '创建直播间'}
      {href: '/youth/live/room',    icon: 'video-camera',  name: '直播间预览'}
      {href: '/youth/live/records', icon: 'video-camera',  name: '录像回放'}
    ]
  }
  {
    subkey: 'sub-consultant'
    subicon: 'solution'
    subname: '顾问'
    menus: [
      {href: '/youth/consultant/learners',      icon: 'team', name: '学员列表'}
      {href: '/youth/consultant/learners/edit', icon: 'edit', name: '新增/编辑学员'}
    ]
  }
  {
    subkey: 'sub-manager'
    subicon: 'solution'
    subname: '管理师'
    menus: [
      {href: '/youth/manager/learners',      icon: 'team', name: '学员列表'}
      {href: '/youth/manager/learners/edit', icon: 'edit', name: '编辑学员'}
      {href: '/youth/manager/initial_assessment',      icon: 'check', name: '初始评估'}
      {href: '/youth/manager/schedule',      icon: 'bars', name: '排课'}
    ]
  }
  {
    subkey: 'sub-learner'
    subicon: 'solution'
    subname: '学员'
    menus: [
      {href: '/youth/learner/courses', icon: 'book',          name: '我的课程'}
      {href: '/youth/learner/info',    icon: 'info-circle-o', name: '账号信息'}
    ]
  }
  {
    subkey: 'sub-teacher'
    subicon: 'solution'
    subname: '教师'
    menus: [
      {href: '/youth/teacher/courses', icon: 'calendar', name: '课程安排'}
    ]
  }
]