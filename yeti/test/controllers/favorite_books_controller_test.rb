require 'test_helper'

class FavoriteBooksControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get favorite_books_update_url
    assert_response :success
  end

end
