require 'test_helper'

class Transaction::Record::TaxesControllerTest < ActionController::TestCase
  setup do
    @transaction_record_taxis = transaction_record_taxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transaction_record_taxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transaction_record_taxis" do
    assert_difference('Transaction::Record::Taxe.count') do
      post :create, :transaction_record_taxis => @transaction_record_taxis.attributes
    end

    assert_redirected_to transaction_record_taxis_path(assigns(:transaction_record_taxis))
  end

  test "should show transaction_record_taxis" do
    get :show, :id => @transaction_record_taxis.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @transaction_record_taxis.to_param
    assert_response :success
  end

  test "should update transaction_record_taxis" do
    put :update, :id => @transaction_record_taxis.to_param, :transaction_record_taxis => @transaction_record_taxis.attributes
    assert_redirected_to transaction_record_taxis_path(assigns(:transaction_record_taxis))
  end

  test "should destroy transaction_record_taxis" do
    assert_difference('Transaction::Record::Taxe.count', -1) do
      delete :destroy, :id => @transaction_record_taxis.to_param
    end

    assert_redirected_to transaction_record_taxes_path
  end
end
