require "test_helper"

class GenreControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get genre_new_url
    assert_response :success
  end
end
