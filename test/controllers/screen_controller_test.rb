require "test_helper"

class ScreenControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get screen_new_url
    assert_response :success
  end
end
