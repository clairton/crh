require 'test_helper'

class Transaction::Record::TotsControllerTest < ActionController::TestCase
  setup do
    @transaction_record_tot = transaction_record_tots(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transaction_record_tots)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transaction_record_tot" do
    assert_difference('Transaction::Record::Tot.count') do
      post :create, :transaction_record_tot => @transaction_record_tot.attributes
    end

    assert_redirected_to transaction_record_tot_path(assigns(:transaction_record_tot))
  end

  test "should show transaction_record_tot" do
    get :show, :id => @transaction_record_tot.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @transaction_record_tot.to_param
    assert_response :success
  end

  test "should update transaction_record_tot" do
    put :update, :id => @transaction_record_tot.to_param, :transaction_record_tot => @transaction_record_tot.attributes
    assert_redirected_to transaction_record_tot_path(assigns(:transaction_record_tot))
  end

  test "should destroy transaction_record_tot" do
    assert_difference('Transaction::Record::Tot.count', -1) do
      delete :destroy, :id => @transaction_record_tot.to_param
    end

    assert_redirected_to transaction_record_tots_path
  end
end
