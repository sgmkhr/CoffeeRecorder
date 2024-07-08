require "test_helper"

class Seller::MakersControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get seller_makers_edit_url
    assert_response :success
  end
end
