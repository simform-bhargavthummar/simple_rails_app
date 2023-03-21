require "test_helper"

class OrderRoutesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get order_routes_index_url
    assert_response :success
  end

  test "should get new" do
    get order_routes_new_url
    assert_response :success
  end

  test "should get edit" do
    get order_routes_edit_url
    assert_response :success
  end
end
