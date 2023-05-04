require "test_helper"

class ProductLayoutsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get product_layouts_index_url
    assert_response :success
  end

  test "should get new" do
    get product_layouts_new_url
    assert_response :success
  end

  test "should get edit" do
    get product_layouts_edit_url
    assert_response :success
  end
end
