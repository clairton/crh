require 'test_helper'

class Goods::Additional::TypesControllerTest < ActionController::TestCase
  setup do
    @goods_additional_type = goods_additional_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:goods_additional_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create goods_additional_type" do
    assert_difference('Goods::Additional::Type.count') do
      post :create, :goods_additional_type => @goods_additional_type.attributes
    end

    assert_redirected_to goods_additional_type_path(assigns(:goods_additional_type))
  end

  test "should show goods_additional_type" do
    get :show, :id => @goods_additional_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @goods_additional_type.to_param
    assert_response :success
  end

  test "should update goods_additional_type" do
    put :update, :id => @goods_additional_type.to_param, :goods_additional_type => @goods_additional_type.attributes
    assert_redirected_to goods_additional_type_path(assigns(:goods_additional_type))
  end

  test "should destroy goods_additional_type" do
    assert_difference('Goods::Additional::Type.count', -1) do
      delete :destroy, :id => @goods_additional_type.to_param
    end

    assert_redirected_to goods_additional_types_path
  end
end
