require 'test_helper'

module Members
  class ShowTest < ActionDispatch::IntegrationTest
    fixtures :members

    setup do
      @current_user = JSON.parse({ name: 'Spec' }.to_json, object_class: OpenStruct)
      WebMock.stub_request(:get, %r{#{ENV['HTTP_IAM_URL']}/permissions/}).to_return(
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

    test 'Show Data' do
      ctx = Operation::Show.call(params: { id: members(:spec).id },current_user: @current_user, action: 'DUMMY_ACTION_ID')
      assert_equal members(:spec).name, ctx[:model].name
    end

    test 'Show No Data' do
      e = assert_raises InvalidParameters do
        Operation::Show.call(params: { id: -1 },current_user: @current_user, action: 'DUMMY_ACTION_ID')
      end
      assert_equal ['Parameters is invalid'], JSON.parse(e.message)
    end
  end
end
