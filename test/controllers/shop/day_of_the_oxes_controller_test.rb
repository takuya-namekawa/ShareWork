require "test_helper"

class Shop::DayOfTheOxesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shop_day_of_the_oxes_index_url
    assert_response :success
  end

  test "should get edit" do
    get shop_day_of_the_oxes_edit_url
    assert_response :success
  end
end
