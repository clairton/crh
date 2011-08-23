require 'test_helper'

class Transaction::Goods::AdditionalsControllerTest < ActionController::TestCase
  setup do
    @transaction_goods_additional = transaction_goods_additionals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transaction_goods_additionals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transaction_goods_additional" do
    assert_difference('Transaction::Goods::Additional.count') do
      post :create, :transaction_goods_additional => @transaction_goods_additional.attributes
    end

    assert_redirected_to transaction_goods_additional_path(assigns(:transaction_goods_additional))
  end

  test "should show transaction_goods_additional" do
    get :show, :id => @transaction_goods_additional.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @transaction_goods_additional.to_param
    assert_response :success
  end

  test "should update transaction_goods_additional" do
    put :update, :id => @transaction_goods_additional.to_param, :transaction_goods_additional => @transaction_goods_additional.attributes
    assert_redirected_to transaction_goods_additional_path(assigns(:transaction_goods_additional))
  end

  test "should destroy transaction_goods_additional" do
    assert_difference('Transaction::Goods::Additional.count', -1) do
      delete :destroy, :id => @transaction_goods_additional.to_param
    end

    assert_redirected_to transaction_goods_additionals_path
  end
end
