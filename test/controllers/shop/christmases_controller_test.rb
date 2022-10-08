require "test_helper"

class Shop::ChristmasesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shop_christmases_index_url
    assert_response :success
  end

  test "should get edit" do
    get shop_christmases_edit_url
    assert_response :success
  end
end
