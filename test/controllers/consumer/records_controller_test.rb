require "test_helper"

class Consumer::RecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get consumer_records_show_url
    assert_response :success
  end

  test "should get edit" do
    get consumer_records_edit_url
    assert_response :success
  end
end
