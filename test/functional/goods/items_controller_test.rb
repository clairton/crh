require 'test_helper'

class Goods::ItemsControllerTest < ActionController::TestCase
  setup do
    @goods_item = goods_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:goods_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create goods_item" do
    assert_difference('Goods::Item.count') do
      post :create, :goods_item => @goods_item.attributes
    end

    assert_redirected_to goods_item_path(assigns(:goods_item))
  end

  test "should show goods_item" do
    get :show, :id => @goods_item.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @goods_item.to_param
    assert_response :success
  end

  test "should update goods_item" do
    put :update, :id => @goods_item.to_param, :goods_item => @goods_item.attributes
    assert_redirected_to goods_item_path(assigns(:goods_item))
  end

  test "should destroy goods_item" do
    assert_difference('Goods::Item.count', -1) do
      delete :destroy, :id => @goods_item.to_param
    end

    assert_redirected_to goods_items_path
  end
end
