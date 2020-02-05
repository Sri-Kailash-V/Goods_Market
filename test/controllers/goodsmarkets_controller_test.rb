require 'test_helper'

class GoodsmarketsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get goodsmarkets_index_url
    assert_response :success
  end

  test "should get customer" do
    get goodsmarkets_customer_url
    assert_response :success
  end

  test "should get manufacturer" do
    get goodsmarkets_manufacturer_url
    assert_response :success
  end

end
