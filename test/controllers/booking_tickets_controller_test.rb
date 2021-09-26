require "test_helper"

class BookingTicketsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get booking_tickets_show_url
    assert_response :success
  end

  test "should get index" do
    get booking_tickets_index_url
    assert_response :success
  end
end
