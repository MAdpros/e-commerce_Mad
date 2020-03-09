require 'test_helper'

class LinersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @liner = liners(:one)
  end

  test "should get index" do
    get liners_url
    assert_response :success
  end

  test "should get new" do
    get new_liner_url
    assert_response :success
  end

  test "should create liner" do
    assert_difference('Liner.count') do
      post liners_url, params: { liner: { delivery_id: @liner.delivery_id, transit_id: @liner.transit_id } }
    end

    assert_redirected_to liner_url(Liner.last)
  end

  test "should show liner" do
    get liner_url(@liner)
    assert_response :success
  end

  test "should get edit" do
    get edit_liner_url(@liner)
    assert_response :success
  end

  test "should update liner" do
    patch liner_url(@liner), params: { liner: { delivery_id: @liner.delivery_id, transit_id: @liner.transit_id } }
    assert_redirected_to liner_url(@liner)
  end

  test "should destroy liner" do
    assert_difference('Liner.count', -1) do
      delete liner_url(@liner)
    end

    assert_redirected_to liners_url
  end
end
