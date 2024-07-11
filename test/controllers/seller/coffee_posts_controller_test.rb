require "test_helper"

class Seller::CoffeePostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get seller_coffee_posts_new_url
    assert_response :success
  end

  test "should get show" do
    get seller_coffee_posts_show_url
    assert_response :success
  end

  test "should get edit" do
    get seller_coffee_posts_edit_url
    assert_response :success
  end
end
