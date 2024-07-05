require "test_helper"

class Consumer::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get consumer_homes_top_url
    assert_response :success
  end
end
