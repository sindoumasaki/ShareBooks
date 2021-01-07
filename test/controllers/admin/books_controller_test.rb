require 'test_helper'

class Admin::BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_books_show_url
    assert_response :success
  end

  test "should get new_index" do
    get admin_books_new_index_url
    assert_response :success
  end

end
