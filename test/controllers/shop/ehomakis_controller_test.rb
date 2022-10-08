require "test_helper"

class Shop::EhomakisControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shop_ehomakis_index_url
    assert_response :success
  end

  test "should get edit" do
    get shop_ehomakis_edit_url
    assert_response :success
  end
end
