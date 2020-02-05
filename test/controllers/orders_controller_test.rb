require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get confirm" do
    get orders_confirm_url
    assert_response :success
  end

  test "should get cancel" do
    get orders_cancel_url
    assert_response :success
  end

  test "should get show" do
    get orders_show_url
    assert_response :success
  end

end
