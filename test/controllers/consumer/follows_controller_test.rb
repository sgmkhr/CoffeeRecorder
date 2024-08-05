require "test_helper"

class Consumer::FollowsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get consumer_follows_index_url
    assert_response :success
  end
end
