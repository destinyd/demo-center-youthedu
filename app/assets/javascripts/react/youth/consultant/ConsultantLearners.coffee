{ LearnersTable } = YouthCommon
{ Button } = antd

module.exports = ConsultantLearners = React.createClass
  render: ->
    <div>
      <LearnersTable render_title={@render_table_title} use_role='consultant'/>
    </div>

  render_table_title: ->
    <div>
      <Button type='primary' icon='plus' onClick={-> Turbolinks.visit '/youth/consultant/learners/edit'}>新增学员</Button>
    </div>