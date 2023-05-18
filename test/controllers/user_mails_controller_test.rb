require "test_helper"

class UserMailsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_mails_index_url
    assert_response :success
  end

  test "should get new" do
    get user_mails_new_url
    assert_response :success
  end

  test "should get edit" do
    get user_mails_edit_url
    assert_response :success
  end
end
