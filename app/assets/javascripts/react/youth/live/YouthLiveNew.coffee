{ Form, Input, Col, DatePicker, TimePicker, Button, Icon } = antd
{ RangePicker } = DatePicker

FormItem = Form.Item

YouthLiveNew = React.createClass
  handle_submit: (evt)->
    evt.preventDefault()
    form_data = @props.form.getFieldsValue()
    data =
      title: form_data.title
      start: new Date(form_data.start_end_time[0]).format('yyyy-MM-dd hh:mm')
      end: new Date(form_data.start_end_time[1]).format('yyyy-MM-dd hh:mm')

    jQuery.ajax
      url: '/live_items/create_live'
      type: 'POST'
      data: data

    .done (res)->
      console.log res
      location.href = '/youth/live'


  cancel: ->
    Turbolinks.visit '/youth/live'

  render: ->
    { getFieldProps } = @props.form

    fi_layout =
      labelCol: { span: 3 }
      wrapperCol: { span: 14 }

    default_time = [new Date, null]

    <div>
      <h2 style={marginBottom: '3rem'}>创建直播间</h2>

      <div style={maxWidth: 600}>
        <Form onSubmit={@handle_submit}>
          <FormItem
            {...fi_layout}
            label="直播名称"
          >
            <Input type="text" placeholder="随便写吧" {...getFieldProps('title')} />
          </FormItem>

          <FormItem
            {...fi_layout}
            label="起止时间"
          >
            <RangePicker defaultValue={default_time} showTime format="yyyy/MM/dd HH:mm" {...getFieldProps('start_end_time')} />
          </FormItem>

          <FormItem
            wrapperCol={ span: 14, offset: 3 }
          >
            <Button type="primary" htmlType="submit"><Icon type='check' /> 确定</Button>
            <Button style={marginLeft: '1rem'} onClick={@cancel}>取消</Button>
          </FormItem>
        </Form>
      </div>
    </div>

module.exports = Form.create()(YouthLiveNew)