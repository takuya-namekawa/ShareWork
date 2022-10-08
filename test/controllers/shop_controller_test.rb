require "test_helper"

class ShopControllerTest < ActionDispatch::IntegrationTest
  test "should get t.integer" do
    get shop_t.integer_url
    assert_response :success
  end

  test "should get :shop_id," do
    get shop_:shop_id,_url
    assert_response :success
  end

  test "should get null:" do
    get shop_null:_url
    assert_response :success
  end

  test "should get false" do
    get shop_false_url
    assert_response :success
  end
end
