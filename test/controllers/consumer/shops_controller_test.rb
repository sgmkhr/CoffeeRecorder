require "test_helper"

class Consumer::ShopsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get consumer_shops_index_url
    assert_response :success
  end

  test "should get show" do
    get consumer_shops_show_url
    assert_response :success
  end
end
