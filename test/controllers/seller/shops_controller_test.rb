require "test_helper"

class Seller::ShopsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get seller_shops_index_url
    assert_response :success
  end

  test "should get show" do
    get seller_shops_show_url
    assert_response :success
  end

  test "should get edit" do
    get seller_shops_edit_url
    assert_response :success
  end
end
