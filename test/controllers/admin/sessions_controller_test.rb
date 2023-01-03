require "test_helper"

class Admin::SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_sessions_index_url
    assert_response :success
  end
end
