require 'test_helper'

module Media
  class IndexTest < ActionDispatch::IntegrationTest
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

    test 'Index Data' do
      ctx = Operation::Index.call(params: {}, current_user: @current_user, action: 'DUMMY_ACTION_ID')
      assert ctx[:model].Media.present?
      assert_equal ::Medium.all.count, ctx[:model].Media.length
    end

    test 'Index No Data' do
      ::Medium.all.each(&:destroy)
      assert_equal [], Operation::Index.call(params: {}, current_user: @current_user, action: 'DUMMY_ACTION_ID')[:model].Media
    end
  end
end
