{ Form, Input, Button, Icon } = antd
{ PageTitle } = Layout
{ LearnerForm } = YouthCommon


module.exports = ConsultantEditLearner = React.createClass
  cancel: ->
    Turbolinks.visit '/youth/consultant/learners'

  submit: (data)->
    console.log data
    Turbolinks.visit '/youth/consultant/learners'

  render: ->
    <div>
      <PageTitle>编辑学员信息</PageTitle>
      <LearnerForm cancel={@cancel} submit={@submit}/>
    </div>