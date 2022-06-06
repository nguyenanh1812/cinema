require 'test_helper'

class ScreensControllerTest < ActionDispatch::IntegrationTest
  test 'should get Show' do
    get screens_Show_url
    assert_response :success
  end
end
