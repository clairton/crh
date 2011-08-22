require 'test_helper'

class Transaction::Tot::ValuesControllerTest < ActionController::TestCase
  setup do
    @transaction_tot_value = transaction_tot_values(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transaction_tot_values)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transaction_tot_value" do
    assert_difference('Transaction::Tot::Value.count') do
      post :create, :transaction_tot_value => @transaction_tot_value.attributes
    end

    assert_redirected_to transaction_tot_value_path(assigns(:transaction_tot_value))
  end

  test "should show transaction_tot_value" do
    get :show, :id => @transaction_tot_value.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @transaction_tot_value.to_param
    assert_response :success
  end

  test "should update transaction_tot_value" do
    put :update, :id => @transaction_tot_value.to_param, :transaction_tot_value => @transaction_tot_value.attributes
    assert_redirected_to transaction_tot_value_path(assigns(:transaction_tot_value))
  end

  test "should destroy transaction_tot_value" do
    assert_difference('Transaction::Tot::Value.count', -1) do
      delete :destroy, :id => @transaction_tot_value.to_param
    end

    assert_redirected_to transaction_tot_values_path
  end
end
