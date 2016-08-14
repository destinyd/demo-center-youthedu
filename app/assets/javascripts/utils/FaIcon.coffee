module.exports = FaIcon = React.createClass
  render: ->
    klass = ["fa fa-#{@props.type}", @props.className].join(' ')

    <i className={klass} />