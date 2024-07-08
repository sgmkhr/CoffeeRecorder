require "test_helper"

class Consumer::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get consumer_users_edit_url
    assert_response :success
  end
end
