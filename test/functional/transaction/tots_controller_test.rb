require 'test_helper'

class Transaction::TotsControllerTest < ActionController::TestCase
  setup do
    @transaction_tot = transaction_tots(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transaction_tots)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transaction_tot" do
    assert_difference('Transaction::Tot.count') do
      post :create, :transaction_tot => @transaction_tot.attributes
    end

    assert_redirected_to transaction_tot_path(assigns(:transaction_tot))
  end

  test "should show transaction_tot" do
    get :show, :id => @transaction_tot.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @transaction_tot.to_param
    assert_response :success
  end

  test "should update transaction_tot" do
    put :update, :id => @transaction_tot.to_param, :transaction_tot => @transaction_tot.attributes
    assert_redirected_to transaction_tot_path(assigns(:transaction_tot))
  end

  test "should destroy transaction_tot" do
    assert_difference('Transaction::Tot.count', -1) do
      delete :destroy, :id => @transaction_tot.to_param
    end

    assert_redirected_to transaction_tots_path
  end
end
