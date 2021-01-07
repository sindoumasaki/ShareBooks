require 'test_helper'

class User::BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_books_index_url
    assert_response :success
  end

  test "should get show" do
    get user_books_show_url
    assert_response :success
  end

  test "should get new" do
    get user_books_new_url
    assert_response :success
  end

end
