require 'test_helper'

module Members
  class CreateTest < ActionDispatch::IntegrationTest
    fixtures :members

    setup do
      @current_user = JSON.parse({ name: 'Spec' }.to_json, object_class: OpenStruct)
      WebMock.stub_request(:get, "#{ENV['HTTP_IAM_URL']}/permissions/00000000-0000-0000-0000-000000000000").to_return(
        body: File.read("#{Rails.root}/test/fixtures/files/platform_iam_get_permission.json"),
        status: 200,
        headers: { 'Content-Type': 'application/json' }
      )
    end

    def default_params
      { email: 'spec@panicboat.net', name: 'Spec' }
    end

    def expected_attrs
      { email: 'spec@panicboat.net', name: 'Spec' }
    end

    test 'Permission Deny' do
      e = assert_raises InvalidPermissions do
        Operation::Create.call(params: default_params)
      end
      assert_equal ['Permissions is invalid'], JSON.parse(e.message)
    end

    test 'Create Data' do
      ctx = Operation::Create.call(params: default_params, current_user: @current_user)
      assert ctx.success?
      assert_equal 'Spec', ctx[:model].name
    end

    test 'Create Duplicate Url' do
      Operation::Create.call(params: default_params, current_user: @current_user)
      e = assert_raises InvalidParameters do
        Operation::Create.call(params: default_params, current_user: @current_user)
      end
      assert_equal ['Url has already been taken'], JSON.parse(e.message)
    end
  end
end
