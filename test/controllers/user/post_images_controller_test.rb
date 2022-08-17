require "test_helper"

class User::PostImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_post_images_new_url
    assert_response :success
  end

  test "should get index" do
    get user_post_images_index_url
    assert_response :success
  end

  test "should get show" do
    get user_post_images_show_url
    assert_response :success
  end
end
