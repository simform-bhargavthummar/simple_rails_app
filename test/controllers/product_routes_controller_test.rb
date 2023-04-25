require "test_helper"

class ProductRoutesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get product_routes_index_url
    assert_response :success
  end

  test "should get new" do
    get product_routes_new_url
    assert_response :success
  end

  test "should get edit" do
    get product_routes_edit_url
    assert_response :success
  end
end
