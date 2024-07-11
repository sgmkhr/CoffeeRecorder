require "test_helper"

class Consumer::InformationPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get consumer_information_posts_show_url
    assert_response :success
  end
end
