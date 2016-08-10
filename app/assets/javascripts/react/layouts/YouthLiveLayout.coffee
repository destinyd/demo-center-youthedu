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
        defaultOpenKeys={['sub-live']}
        defaultSelectedKeys={[@state.selected_key]}
      >
        <SubMenu key='sub-live' title={<span><Icon type="video-camera" /> 直播</span>}>
          <Menu.Item key='live'>
            <a href='/youth/live' onClick={(evt)-> evt.stopPropagation()}>
              <Icon type='bars' /><span className='nav-text'>直播间列表</span>
            </a>
          </Menu.Item>
          <Menu.Item key='new-live-room'>
            <a href='/youth/live/new' onClick={(evt)-> evt.stopPropagation()}>
              <Icon type='plus' /><span className='nav-text'>创建直播间</span>
            </a>
          </Menu.Item>
          <Menu.Item key='live-room'>
            <a href='/youth/live/room' onClick={(evt)-> evt.stopPropagation()}>
              <Icon type='video-camera' /><span className='nav-text'>直播间预览</span>
            </a>
          </Menu.Item>
        </SubMenu>
      </Menu>

      {aside_action}
    </aside>
