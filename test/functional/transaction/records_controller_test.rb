require 'test_helper'

class Transaction::RecordsControllerTest < ActionController::TestCase
  setup do
    @transaction_record = transaction_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transaction_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transaction_record" do
    assert_difference('Transaction::Record.count') do
      post :create, :transaction_record => @transaction_record.attributes
    end

    assert_redirected_to transaction_record_path(assigns(:transaction_record))
  end

  test "should show transaction_record" do
    get :show, :id => @transaction_record.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @transaction_record.to_param
    assert_response :success
  end

  test "should update transaction_record" do
    put :update, :id => @transaction_record.to_param, :transaction_record => @transaction_record.attributes
    assert_redirected_to transaction_record_path(assigns(:transaction_record))
  end

  test "should destroy transaction_record" do
    assert_difference('Transaction::Record.count', -1) do
      delete :destroy, :id => @transaction_record.to_param
    end

    assert_redirected_to transaction_records_path
  end
end
