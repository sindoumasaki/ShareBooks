require 'test_helper'

class User::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get user_users_show_url
    assert_response :success
  end

  test "should get my_page" do
    get user_users_my_page_url
    assert_response :success
  end

  test "should get follows" do
    get user_users_follows_url
    assert_response :success
  end

  test "should get follower" do
    get user_users_follower_url
    assert_response :success
  end

end
