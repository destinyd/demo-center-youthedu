{ Table, Modal, Button, Icon } = antd

module.exports = LearnersTable = React.createClass
  show_manager_assign_modal: ->
    @refs.assign_worker.open()

  render: ->
    role = @props.use_role

    dataSource = [
      {
        key: '1'
        name: '傅园慧'
        gender: '女'
        consultant: '罗小黑'
        manager: '布朗熊'
      }
      {
        key: '2'
        name: '孙杨'
        gender: '男'
        consultant: '兔斯基'
        manager: null
      }
      {
        key: '3'
        name: '福原爱'
        gender: '女'
        consultant: '罗小黑'
        manager: '彼尔德'
      }
      {
        key: '4'
        name: '张继科'
        gender: '男'
        consultant: null
        manager: '布朗熊'
      }
      {
        key: '5'
        name: '黄旭东'
        gender: '男'
        consultant: '猫叔'
        manager: '彼尔德'
      }
      {
        key: '6'
        name: '孙一峰'
        gender: '男'
        consultant: '猫叔'
        manager: '彼尔德'
      }
    ]

    columns_basic = [
      {
        title: '姓名'
        dataIndex: 'name'
        key: 'name'
      }
      {
        title: '性别'
        dataIndex: 'gender'
        key: 'gender'
      }
      {
        title: '注册日期'
        dataIndex: 'date'
        key: 'date'
        render: ->
          <span>2016-06-06</span>
      }
    ]

    columns_ext = 
      consultant: [
        {
          title: '管理师'
          dataIndex: 'manager'
          key: 'manager'
          render: (manager)=>
            <div>
              {
                if manager?
                then <span>{manager}</span>
                else <span style={color: '#ccc'}>未指派</span>
              }
              <span className='ant-divider' />
              <a href='javascript:;' onClick={@show_manager_assign_modal}><FaIcon type='hand-o-right' /> 指派</a>
            </div>
        }
        {
          title: '操作'
          key: 'ops-consultant'
          render: =>
            <div>
              <a href='/youth/consultant/learners/edit'><Icon type='edit'/> 编辑</a>
            </div>
        }
      ]

      manager: [
        {
          title: '顾问'
          dataIndex: 'consultant'
          key: 'consultant'
          render: (consultant)->
            # <div>
            #   {
            #     if consultant?
            #     then <span>{consultant}</span>
            #     else <span style={color: '#ccc'}>未指派</span>
            #   }
            #   <span className='ant-divider' />
            #   <a>指派</a>
            # </div>
            <div>
              {
                if consultant?
                then <span>{consultant}</span>
                else <span style={color: '#ccc'}>没有顾问</span>
              }
            </div>
        }
        {
          title: '操作'
          key: 'ops-manager'
          render: =>
            <div>
              <a href='/youth/consultant/learners/edit'><Icon type='edit' /> 编辑</a>
              <span className='ant-divider' />
              <a href='/youth/manager/initial_assessment'><Icon type='bar-chart' /> 初始评估</a>
              <span className='ant-divider' />
              <a href='/youth/manager/schedule'><Icon type='calendar' /> 排课</a> 
            </div>
        }
      ]

    columns = columns_basic.concat columns_ext[role]

    <div>
      <Table 
        columns={columns} 
        dataSource={dataSource}
        title={@props.render_title}
        expandedRowRender={(record)->
          <div>家长联系信息</div>
        }
      />
      <AssignWorker ref='assign_worker' />
    </div>


AssignWorker = React.createClass
  getInitialState: ->
    open: false

  open: ->
    @setState open: true

  close: ->
    @setState open: false

  render: ->
    <Modal title='指派管理师'
      visible={@state.open}
      onOK={@props.ok}
      onCancel={@close}
    >
      <span>rua ha gua rua ha gua rua ha gua</span>
    </Modal>