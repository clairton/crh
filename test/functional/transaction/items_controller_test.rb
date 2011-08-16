require 'test_helper'

class Transaction::ItemsControllerTest < ActionController::TestCase
  setup do
    @transaction_item = transaction_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transaction_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transaction_item" do
    assert_difference('Transaction::Item.count') do
      post :create, :transaction_item => @transaction_item.attributes
    end

    assert_redirected_to transaction_item_path(assigns(:transaction_item))
  end

  test "should show transaction_item" do
    get :show, :id => @transaction_item.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @transaction_item.to_param
    assert_response :success
  end

  test "should update transaction_item" do
    put :update, :id => @transaction_item.to_param, :transaction_item => @transaction_item.attributes
    assert_redirected_to transaction_item_path(assigns(:transaction_item))
  end

  test "should destroy transaction_item" do
    assert_difference('Transaction::Item.count', -1) do
      delete :destroy, :id => @transaction_item.to_param
    end

    assert_redirected_to transaction_items_path
  end
end
