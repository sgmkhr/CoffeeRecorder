require "test_helper"

class Consumer::CoffeePostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get consumer_coffee_posts_index_url
    assert_response :success
  end

  test "should get show" do
    get consumer_coffee_posts_show_url
    assert_response :success
  end
end
