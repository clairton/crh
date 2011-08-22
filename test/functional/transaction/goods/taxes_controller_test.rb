require 'test_helper'

class Transaction::Goods::TaxesControllerTest < ActionController::TestCase
  setup do
    @transaction_goods_taxis = transaction_goods_taxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transaction_goods_taxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transaction_goods_taxis" do
    assert_difference('Transaction::Goods::Taxe.count') do
      post :create, :transaction_goods_taxis => @transaction_goods_taxis.attributes
    end

    assert_redirected_to transaction_goods_taxis_path(assigns(:transaction_goods_taxis))
  end

  test "should show transaction_goods_taxis" do
    get :show, :id => @transaction_goods_taxis.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @transaction_goods_taxis.to_param
    assert_response :success
  end

  test "should update transaction_goods_taxis" do
    put :update, :id => @transaction_goods_taxis.to_param, :transaction_goods_taxis => @transaction_goods_taxis.attributes
    assert_redirected_to transaction_goods_taxis_path(assigns(:transaction_goods_taxis))
  end

  test "should destroy transaction_goods_taxis" do
    assert_difference('Transaction::Goods::Taxe.count', -1) do
      delete :destroy, :id => @transaction_goods_taxis.to_param
    end

    assert_redirected_to transaction_goods_taxes_path
  end
end
