{ Button } = antd
{ PageTitle } = Layout

module.exports = ManagerInitialAssessment = React.createClass
  render: ->
    <div>
      <PageTitle>初始评估</PageTitle>

      <div>
      <Button type='primary' style={marginRight: '1rem'}>发起线上测验</Button>
      <Button type='primary' >记录线下测验</Button>
      </div>
    </div>