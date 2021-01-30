require 'test_helper'

module Media
  class DestroyTest < ActionDispatch::IntegrationTest
    fixtures :media

    setup do
      @current_user = JSON.parse({ name: 'Spec' }.to_json, object_class: OpenStruct)
      WebMock.stub_request(:get, %r{#{ENV['HTTP_IAM_URL']}/permissions/}).to_return(
        body: File.read("#{Rails.root}/test/fixtures/files/platform_iam_get_permission.json"),
        status: 200,
        headers: { 'Content-Type': 'application/json' }
      )
    end

    def default_params
      { member_id: media(:spec).member_id, name: 'Spec', url: 'https://spec.panicboat.net' }
    end

    def expected_attrs
      { member_id: media(:spec).member_id, name: 'Spec', url: 'https://spec.panicboat.net' }
    end

    test 'Permission Deny' do
      e = assert_raises InvalidPermissions do
        Operation::Destroy.call(params: { id: media(:spec).id })
      end
      assert_equal ['Permissions is invalid'], JSON.parse(e.message)
    end

    test 'Destory Data' do
      ctx = Operation::Destroy.call(params: { id: media(:spec).id }, current_user: @current_user, action: 'DUMMY_ACTION_ID')
      assert ctx.success?
      assert_equal [], ::Medium.where({ id: media(:spec).id })
    end

    test 'Destory Data Related Member' do
      id = media(:spec).id
      ::Member.find(media(:spec).member_id).destroy
      assert_equal [], ::Medium.where({ id: id })
    end

    test 'Destroy No Data' do
      e = assert_raises InvalidParameters do
        Operation::Destroy.call(params: { id: -1 }, current_user: @current_user, action: 'DUMMY_ACTION_ID')
      end
      assert_equal ['Parameters is invalid'], JSON.parse(e.message)
    end
  end
end
