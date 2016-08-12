{ Form, Input, Button, Icon } = antd
{ PageTitle } = Layout
{ LearnerForm } = YouthCommon


module.exports = ManagerEditLearner = React.createClass
  cancel: ->
    Turbolinks.visit '/youth/manager/learners'

  render: ->
    <div>
      <PageTitle>编辑学员信息</PageTitle>
      <LearnerForm cancel={@cancel}/>
    </div>