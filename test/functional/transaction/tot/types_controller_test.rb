require 'test_helper'

class Transaction::Tot::TypesControllerTest < ActionController::TestCase
  setup do
    @transaction_tot_type = transaction_tot_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transaction_tot_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transaction_tot_type" do
    assert_difference('Transaction::Tot::Type.count') do
      post :create, :transaction_tot_type => @transaction_tot_type.attributes
    end

    assert_redirected_to transaction_tot_type_path(assigns(:transaction_tot_type))
  end

  test "should show transaction_tot_type" do
    get :show, :id => @transaction_tot_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @transaction_tot_type.to_param
    assert_response :success
  end

  test "should update transaction_tot_type" do
    put :update, :id => @transaction_tot_type.to_param, :transaction_tot_type => @transaction_tot_type.attributes
    assert_redirected_to transaction_tot_type_path(assigns(:transaction_tot_type))
  end

  test "should destroy transaction_tot_type" do
    assert_difference('Transaction::Tot::Type.count', -1) do
      delete :destroy, :id => @transaction_tot_type.to_param
    end

    assert_redirected_to transaction_tot_types_path
  end
end
