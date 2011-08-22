require 'test_helper'

class Transaction::Goods::ItemsControllerTest < ActionController::TestCase
  setup do
    @transaction_goods_item = transaction_goods_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transaction_goods_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transaction_goods_item" do
    assert_difference('Transaction::Goods::Item.count') do
      post :create, :transaction_goods_item => @transaction_goods_item.attributes
    end

    assert_redirected_to transaction_goods_item_path(assigns(:transaction_goods_item))
  end

  test "should show transaction_goods_item" do
    get :show, :id => @transaction_goods_item.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @transaction_goods_item.to_param
    assert_response :success
  end

  test "should update transaction_goods_item" do
    put :update, :id => @transaction_goods_item.to_param, :transaction_goods_item => @transaction_goods_item.attributes
    assert_redirected_to transaction_goods_item_path(assigns(:transaction_goods_item))
  end

  test "should destroy transaction_goods_item" do
    assert_difference('Transaction::Goods::Item.count', -1) do
      delete :destroy, :id => @transaction_goods_item.to_param
    end

    assert_redirected_to transaction_goods_items_path
  end
end
