require "test_helper"

class OrderLayoutsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get order_layouts_index_url
    assert_response :success
  end
end
