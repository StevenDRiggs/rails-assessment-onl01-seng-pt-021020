require 'test_helper'

class FavoriteAuthorsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get favorite_authors_update_url
    assert_response :success
  end

end
