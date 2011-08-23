require 'test_helper'

class Transaction::Record::RecordsControllerTest < ActionController::TestCase
  setup do
    @transaction_record_record = transaction_record_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transaction_record_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transaction_record_record" do
    assert_difference('Transaction::Record::Record.count') do
      post :create, :transaction_record_record => @transaction_record_record.attributes
    end

    assert_redirected_to transaction_record_record_path(assigns(:transaction_record_record))
  end

  test "should show transaction_record_record" do
    get :show, :id => @transaction_record_record.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @transaction_record_record.to_param
    assert_response :success
  end

  test "should update transaction_record_record" do
    put :update, :id => @transaction_record_record.to_param, :transaction_record_record => @transaction_record_record.attributes
    assert_redirected_to transaction_record_record_path(assigns(:transaction_record_record))
  end

  test "should destroy transaction_record_record" do
    assert_difference('Transaction::Record::Record.count', -1) do
      delete :destroy, :id => @transaction_record_record.to_param
    end

    assert_redirected_to transaction_record_records_path
  end
end
