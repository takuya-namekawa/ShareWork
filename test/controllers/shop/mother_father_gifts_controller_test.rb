require "test_helper"

class Shop::MotherFatherGiftsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shop_mother_father_gifts_index_url
    assert_response :success
  end

  test "should get edit" do
    get shop_mother_father_gifts_edit_url
    assert_response :success
  end
end
