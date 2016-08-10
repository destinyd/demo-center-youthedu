{ Table, Modal } = antd

module.exports = LearnersTable = React.createClass
  getInitialState: ->
    visible: false

  show_modal: ->
    @setState visible: true

  cancel_modal: ->
    @setState visible: false

  render: ->
    dataSource = [
      {
        key: '1'
        name: '傅园慧'
        gender: '女'
        parents: '傅爸爸'
        parents_desc: '家长详细信息'
      }
      {
        key: '2'
        name: '孙杨'
        gender: '男'
        parents: '孙妈妈'
        parents_desc: '家长详细信息'
      }
      {
        key: '3'
        name: '福原爱'
        gender: '女'
        parents: '福原爸爸'
        parents_desc: '家长详细信息'
      }
      {
        key: '4'
        name: '张继科'
        gender: '男'
        parents: '张妈妈'
        parents_desc: '家长详细信息'
      }
      {
        key: '5'
        name: '黄旭东'
        gender: '男'
        parents: '黄妈妈'
        parents_desc: '家长详细信息'
      }
      {
        key: '6'
        name: '孙一峰'
        gender: '男'
        parents: '孙妈妈'
        parents_desc: '家长详细信息'
      }
    ]

    columns = [
      {
        title: '姓名'
        dataIndex: 'name'
        key: 'name'
      }
      {
        title: '家长'
        dataIndex: 'parents'
        key: 'parents'
      }
      {
        title: '性别'
        dataIndex: 'gender'
        key: 'gender'
      }
      {
        title: '邮箱'
        dataIndex: 'email'
        key: 'email'
        render: ->
          <span>test@example.com</span>
      }
      {
        title: '电话'
        dataIndex: 'phone'
        key: 'phone'
        render: ->
          <span>13000000000</span>
      }
      {
        title: '注册日期'
        dataIndex: 'date'
        key: 'date'
        render: ->
          <span>2016-06-06</span>
      }
      {
        title: '顾问'
        dataIndex: 'consultant'
        key: 'consultant'
        render: ->
          <span>罗小黑</span>
      }
      {
        title: '管理师'
        dataIndex: 'manager'
        key: 'manager'
        render: ->
          <span>彼尔德</span>
      }
      {
        title: '操作'
        key: 'ops'
        render: =>
          <div>
            <a href='javascript:;' onClick={@show_modal}>顾问：指定管理师</a>
            <span className='ant-divider' />
            <a href='/youth/consultant/learners/edit'>顾问：管理师：编辑</a>
            <span className='ant-divider' />
            <a href='/youth/manager/initial_assessment'>管理师：初始评估</a>
            <span className='ant-divider' />
            <a href='/youth/manager/schedule'>管理师：排课</a> 
          </div>
      }
    ]

    <div>
      <Table 
        columns={columns} 
        dataSource={dataSource}
        title={@props.render_title}
        expandedRowRender={(record)->
          <div>{record.parents_desc}</div>
        }
      />
      <Modal title='指定管理师' visible={@state.visible} onCancel={@cancel_modal}>
        <span>rua ha gua rua ha gua rua ha gua</span>
      </Modal>
    </div>