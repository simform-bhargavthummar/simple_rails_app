require "test_helper"

class EmployeeFormsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get employee_forms_index_url
    assert_response :success
  end

  test "should get new" do
    get employee_forms_new_url
    assert_response :success
  end

  test "should get edit" do
    get employee_forms_edit_url
    assert_response :success
  end
end
