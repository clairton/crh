require 'test_helper'

class Transaction::TaxesControllerTest < ActionController::TestCase
  setup do
    @transaction_taxis = transaction_taxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transaction_taxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transaction_taxis" do
    assert_difference('Transaction::Taxe.count') do
      post :create, :transaction_taxis => @transaction_taxis.attributes
    end

    assert_redirected_to transaction_taxis_path(assigns(:transaction_taxis))
  end

  test "should show transaction_taxis" do
    get :show, :id => @transaction_taxis.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @transaction_taxis.to_param
    assert_response :success
  end

  test "should update transaction_taxis" do
    put :update, :id => @transaction_taxis.to_param, :transaction_taxis => @transaction_taxis.attributes
    assert_redirected_to transaction_taxis_path(assigns(:transaction_taxis))
  end

  test "should destroy transaction_taxis" do
    assert_difference('Transaction::Taxe.count', -1) do
      delete :destroy, :id => @transaction_taxis.to_param
    end

    assert_redirected_to transaction_taxes_path
  end
end
