require 'test_helper'

class Transaction::ItemTaxesControllerTest < ActionController::TestCase
  setup do
    @transaction_item_taxis = transaction_item_taxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transaction_item_taxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transaction_item_taxis" do
    assert_difference('Transaction::ItemTaxe.count') do
      post :create, :transaction_item_taxis => @transaction_item_taxis.attributes
    end

    assert_redirected_to transaction_item_taxis_path(assigns(:transaction_item_taxis))
  end

  test "should show transaction_item_taxis" do
    get :show, :id => @transaction_item_taxis.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @transaction_item_taxis.to_param
    assert_response :success
  end

  test "should update transaction_item_taxis" do
    put :update, :id => @transaction_item_taxis.to_param, :transaction_item_taxis => @transaction_item_taxis.attributes
    assert_redirected_to transaction_item_taxis_path(assigns(:transaction_item_taxis))
  end

  test "should destroy transaction_item_taxis" do
    assert_difference('Transaction::ItemTaxe.count', -1) do
      delete :destroy, :id => @transaction_item_taxis.to_param
    end

    assert_redirected_to transaction_item_taxes_path
  end
end
