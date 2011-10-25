require 'test_helper'

class Goods::Additional::valuesControllerTest < ActionController::TestCase
  setup do
    @goods_additional_value = goods_additional_values(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:goods_additional_values)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create goods_additional_value" do
    assert_difference('Goods::Additional::value.count') do
      post :create, :goods_additional_value => @goods_additional_value.attributes
    end

    assert_redirected_to goods_additional_value_path(assigns(:goods_additional_value))
  end

  test "should show goods_additional_value" do
    get :show, :id => @goods_additional_value.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @goods_additional_value.to_param
    assert_response :success
  end

  test "should update goods_additional_value" do
    put :update, :id => @goods_additional_value.to_param, :goods_additional_value => @goods_additional_value.attributes
    assert_redirected_to goods_additional_value_path(assigns(:goods_additional_value))
  end

  test "should destroy goods_additional_value" do
    assert_difference('Goods::Additional::value.count', -1) do
      delete :destroy, :id => @goods_additional_value.to_param
    end

    assert_redirected_to goods_additional_values_path
  end
end
