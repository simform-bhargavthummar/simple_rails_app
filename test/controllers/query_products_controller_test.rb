require "test_helper"

class QueryProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get query_products_index_url
    assert_response :success
  end

  test "should get new" do
    get query_products_new_url
    assert_response :success
  end

  test "should get edit" do
    get query_products_edit_url
    assert_response :success
  end
end
