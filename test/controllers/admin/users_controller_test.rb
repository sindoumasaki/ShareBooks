require 'test_helper'

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_users_show_url
    assert_response :success
  end

  test "should get index" do
    get admin_users_index_url
    assert_response :success
  end

  test "should get bad_index" do
    get admin_users_bad_index_url
    assert_response :success
  end

  test "should get confirm" do
    get admin_users_confirm_url
    assert_response :success
  end

  test "should get bye_bye" do
    get admin_users_bye_bye_url
    assert_response :success
  end

end
