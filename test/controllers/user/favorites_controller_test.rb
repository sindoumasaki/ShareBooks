require 'test_helper'

class User::FavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_favorites_index_url
    assert_response :success
  end

end
