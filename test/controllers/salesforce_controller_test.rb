require 'test_helper'

class SalesforceControllerTest < ActionDispatch::IntegrationTest
  test "should get callback" do
    get salesforce_callback_url
    assert_response :success
  end

end
