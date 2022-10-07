require "test_helper"

class Shop::SummerGiftsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shop_summer_gifts_index_url
    assert_response :success
  end

  test "should get edit" do
    get shop_summer_gifts_edit_url
    assert_response :success
  end
end
