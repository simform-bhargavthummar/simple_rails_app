require "test_helper"

class UserLayoutsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_layouts_index_url
    assert_response :success
  end
end
