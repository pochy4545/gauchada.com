require 'test_helper'

class BuysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @buy = buys(:one)
  end

  test "should get index" do
    get buys_url
    assert_response :success
  end

  test "should get new" do
    get new_buy_url
    assert_response :success
  end

  test "should create buy" do
    assert_difference('Buy.count') do
      post buys_url, params: { buy: { cantidad: @buy.cantidad, fecha: @buy.fecha, precio_actual: @buy.precio_actual, precio_total: @buy.precio_total } }
    end

    assert_redirected_to buy_url(Buy.last)
  end

  test "should show buy" do
    get buy_url(@buy)
    assert_response :success
  end

  test "should get edit" do
    get edit_buy_url(@buy)
    assert_response :success
  end

  test "should update buy" do
    patch buy_url(@buy), params: { buy: { cantidad: @buy.cantidad, fecha: @buy.fecha, precio_actual: @buy.precio_actual, precio_total: @buy.precio_total } }
    assert_redirected_to buy_url(@buy)
  end

  test "should destroy buy" do
    assert_difference('Buy.count', -1) do
      delete buy_url(@buy)
    end

    assert_redirected_to buys_url
  end
end
