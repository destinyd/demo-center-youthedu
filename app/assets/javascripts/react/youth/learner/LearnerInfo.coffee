module.exports = LearnerInfo = React.createClass
  render: ->
    <div>
      <Card>这是哪</Card>
      <Card>我是谁</Card>
      <Card>谁管我</Card>
      <Card>我给谁钱</Card>
      <Card>我该干嘛</Card>
      <Card>我爸是谁</Card>
    </div>

Card = React.createClass
  render: ->
    style =
      borderRadius: '4px'
      border: 'solid 1px #ddd'
      marginBottom: '1rem'
      marginRight: '1rem'
      fontSize: '16px'
      maxWidth: 320
      float: 'left'

    <div style={style}>
      <div style={borderBottom: 'solid 1px #ddd', padding: '1rem'}>{@props.children}</div>
      <div style={padding: '1rem'}>
        蛤蛤蛤蛤蛤蛤蛤蛤蛤蛤蛤蛤蛤蛤蛤蛤蛤蛤蛤蛤蛤蛤蛤蛤
      </div>
    </div>
