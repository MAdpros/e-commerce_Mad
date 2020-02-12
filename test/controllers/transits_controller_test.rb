require 'test_helper'

class TransitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transit = transits(:one)
  end

  test "should get index" do
    get transits_url
    assert_response :success
  end

  test "should get new" do
    get new_transit_url
    assert_response :success
  end

  test "should create transit" do
    assert_difference('Transit.count') do
      post transits_url, params: { transit: { mode: @transit.mode, name: @transit.name, price: @transit.price } }
    end

    assert_redirected_to transit_url(Transit.last)
  end

  test "should show transit" do
    get transit_url(@transit)
    assert_response :success
  end

  test "should get edit" do
    get edit_transit_url(@transit)
    assert_response :success
  end

  test "should update transit" do
    patch transit_url(@transit), params: { transit: { mode: @transit.mode, name: @transit.name, price: @transit.price } }
    assert_redirected_to transit_url(@transit)
  end

  test "should destroy transit" do
    assert_difference('Transit.count', -1) do
      delete transit_url(@transit)
    end

    assert_redirected_to transits_url
  end
end
