{ Table } = antd

module.exports = LearnerCourses = React.createClass
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