{ LearnersTable } = YouthCommon
{ Button } = antd

module.exports = ConsultantLearners = React.createClass
  render: ->
    <div>
      <div style={marginBottom: '1.5rem'}>
        <Button type='primary' icon='plus' onClick={@open_new}>新增学员</Button>
      </div>
      <LearnersTable use_role='consultant'/>
    </div>

  open_new: ->
    Turbolinks.visit '/youth/consultant/learners/edit'