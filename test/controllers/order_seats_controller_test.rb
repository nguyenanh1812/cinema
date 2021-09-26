require "test_helper"

class OrderSeatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get order_seats_index_url
    assert_response :success
  end
end
