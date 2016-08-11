{ LearnersTable } = YouthCommon
{ Button } = antd

module.exports = ManagerLearners = React.createClass
  render: ->
    <div>
      <LearnersTable use_role='manager'/>
    </div>