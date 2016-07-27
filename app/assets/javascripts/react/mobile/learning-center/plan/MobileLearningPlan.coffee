{ Icon, Progress } = antd

module.exports = MobileLearningPlan = React.createClass
  render: ->
    <MobileLearningCenterLayout 
      title='学习计划夹' 
      menu_active={2}
      right_icon='plus'
    >
      <Search placeholder='在计划夹中搜索' />

      <h3>我的计划夹</h3>
      <Plans
        plans={@props.plans}
      />
    </MobileLearningCenterLayout>

Plans = React.createClass
  render: ->
    <div className='plans'>
    {
      for plan, idx in @props.plans
        <Plan key={idx} plan={plan} />
    }
    </div>

Plan = React.createClass
  render: ->
    <a className='plan shadow-card' href="/mobile/learning-center/plan/#{@props.plan.id}">
      <Icon type='bars' className='icc' />
      <div className='ct'>
        <div className='title'>{@props.plan.name}</div>
        <div className='desc'>{@props.plan?.points?.length} 个知识点</div>
      </div>
      <div className='pgs'>
        <Progress type="circle" percent={37} width={60} strokeWidth={10} />
      </div>
    </a>