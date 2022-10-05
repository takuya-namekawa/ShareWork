require "test_helper"

class Shop::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shop_posts_index_url
    assert_response :success
  end

  test "should get show" do
    get shop_posts_show_url
    assert_response :success
  end

  test "should get edit" do
    get shop_posts_edit_url
    assert_response :success
  end
end
