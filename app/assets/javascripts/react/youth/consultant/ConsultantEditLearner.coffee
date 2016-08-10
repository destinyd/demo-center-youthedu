{ Form, Input, Button, Icon } = antd

FormItem = Form.Item

ConsultantEditLearner = React.createClass
  handle_submit: (evt)->
    evt.preventDefault()
    console.log(@props.form.getFieldsValue())

  cancel: ->
    Turbolinks.visit '/youth/consultant/learners'

  render: ->
    { getFieldProps } = @props.form

    fi_layout =
      labelCol: { span: 3 }
      wrapperCol: { span: 14 }

    <div>
      <h2 style={marginBottom: '3rem'}>编辑学员信息</h2>

      <div style={maxWidth: 600}>
        <Form onSubmit={@handle_submit}>
          <FormItem
            {...fi_layout}
            label="姓名"
          >
            <Input type="text" placeholder="随便写吧" {...getFieldProps('name')} />
          </FormItem>

          <FormItem
            {...fi_layout}
            label="性别"
          >
            <Input type="text" placeholder="随便写吧" {...getFieldProps('gender')} />
          </FormItem>

          <FormItem
            {...fi_layout}
            label="邮箱"
          >
            <Input type="text" placeholder="随便写吧" {...getFieldProps('email')} />
          </FormItem>

          <FormItem
            {...fi_layout}
            label="电话"
          >
            <Input type="text" placeholder="随便写吧" {...getFieldProps('phone')} />
          </FormItem>

          <FormItem
            {...fi_layout}
            label="登录密码"
          >
            <Input type="password" {...getFieldProps('password')} />
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

module.exports = Form.create()(ConsultantEditLearner)