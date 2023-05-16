require "test_helper"

class PostUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get post_users_new_url
    assert_response :success
  end
end
