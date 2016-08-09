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
        onClick={@open}
      >
        <SubMenu key='sub-live' title={<span><Icon type="video-camera" /> 直播</span>}>
          <Menu.Item key='live' path='/youth/live'>
            <Icon type='laptop' /><span className='nav-text'>直播活动列表</span>
          </Menu.Item>
          <Menu.Item key='live-room' path='/youth/live/room'>
            <Icon type='laptop' /><span className='nav-text'>直播间预览</span>
          </Menu.Item>
        </SubMenu>
      </Menu>

      {aside_action}
    </aside>

  open: ({ key, item, keyPath })->
    path = item.props.path
    Turbolinks.visit path
