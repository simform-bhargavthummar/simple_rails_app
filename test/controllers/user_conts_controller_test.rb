require "test_helper"

class UserContsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_conts_new_url
    assert_response :success
  end
end
