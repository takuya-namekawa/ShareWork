require "test_helper"

class Management::ManagementsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get management_managements_show_url
    assert_response :success
  end

  test "should get edit" do
    get management_managements_edit_url
    assert_response :success
  end
end
