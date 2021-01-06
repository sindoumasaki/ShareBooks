require 'test_helper'

class Common::TopsControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get common_tops_top_url
    assert_response :success
  end

end
