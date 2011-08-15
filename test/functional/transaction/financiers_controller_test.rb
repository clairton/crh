require 'test_helper'

class Transaction::FinanciersControllerTest < ActionController::TestCase
  setup do
    @transaction_financier = transaction_financiers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transaction_financiers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transaction_financier" do
    assert_difference('Transaction::Financier.count') do
      post :create, :transaction_financier => @transaction_financier.attributes
    end

    assert_redirected_to transaction_financier_path(assigns(:transaction_financier))
  end

  test "should show transaction_financier" do
    get :show, :id => @transaction_financier.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @transaction_financier.to_param
    assert_response :success
  end

  test "should update transaction_financier" do
    put :update, :id => @transaction_financier.to_param, :transaction_financier => @transaction_financier.attributes
    assert_redirected_to transaction_financier_path(assigns(:transaction_financier))
  end

  test "should destroy transaction_financier" do
    assert_difference('Transaction::Financier.count', -1) do
      delete :destroy, :id => @transaction_financier.to_param
    end

    assert_redirected_to transaction_financiers_path
  end
end
