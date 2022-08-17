require "test_helper"

class User::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get user_users_show_url
    assert_response :success
  end
end
