require "test_helper"

class AurthorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get authors_index_url
    assert_response :success
  end

  test "should get new" do
    get authors_new_url
    assert_response :success
  end

  test "should get edit" do
    get authors_edit_url
    assert_response :success
  end
end
