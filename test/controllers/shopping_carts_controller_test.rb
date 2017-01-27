require 'test_helper'

class ShoppingCartsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get shopping_carts_create_url
    assert_response :success
  end

end
