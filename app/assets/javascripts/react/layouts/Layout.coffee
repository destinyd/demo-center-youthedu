module.exports = Layout =
  PageTitle: React.createClass
    render: ->
      style =
        height: 26
        lineHeight: '26px'
        marginBottom: '1.5rem'
        fontSize: 18
        fontWeight: 'normal'
        borderLeft: 'solid 3px #96DBFA'
        paddingLeft: '13px'

      <div style={padding: '3px 0'}>
        <h2 style={style}>{@props.children}</h2>
      </div>