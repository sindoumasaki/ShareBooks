require 'test_helper'

class User::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get user_homes_home_url
    assert_response :success
  end

end
