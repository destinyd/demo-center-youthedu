{ Form, Input, Button, Icon } = antd

FormItem = Form.Item

LearnerForm = React.createClass
  submit: ->
    console.log(@props.form.getFieldsValue())

  render: ->
    { getFieldProps } = @props.form

    fi_layout =
      labelCol: { span: 3 }
      wrapperCol: { span: 14 }

    <div style={maxWidth: 600}>
      <Form onSubmit={(evt)-> evt.preventDefault()}>
        <FormItem
          {...fi_layout}
          label="姓名"
        >
          <Input type="text" placeholder="韩梅梅" {...getFieldProps('name')} />
        </FormItem>

        <FormItem
          {...fi_layout}
          label="性别"
        >
          <Input type="text" placeholder="女" {...getFieldProps('gender')} />
        </FormItem>

        <FormItem
          {...fi_layout}
          label="邮箱"
        >
          <Input type="text" placeholder="hmm@example.com" {...getFieldProps('email')} />
        </FormItem>

        <FormItem
          {...fi_layout}
          label="电话"
        >
          <Input type="text" placeholder="13800000000" {...getFieldProps('phone')} />
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
          <Button type="primary" onClick={@submit}><Icon type='check' /> 确定</Button>
          <Button style={marginLeft: '1rem'} onClick={@props.cancel}>取消</Button>
        </FormItem>
      </Form>
    </div>

module.exports = Form.create()(LearnerForm)