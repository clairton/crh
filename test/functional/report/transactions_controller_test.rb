require 'test_helper'

class Report::TransactionsControllerTest < ActionController::TestCase
  setup do
    @report_transaction = report_transactions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:report_transactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create report_transaction" do
    assert_difference('Report::Transaction.count') do
      post :create, :report_transaction => @report_transaction.attributes
    end

    assert_redirected_to report_transaction_path(assigns(:report_transaction))
  end

  test "should show report_transaction" do
    get :show, :id => @report_transaction.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @report_transaction.to_param
    assert_response :success
  end

  test "should update report_transaction" do
    put :update, :id => @report_transaction.to_param, :report_transaction => @report_transaction.attributes
    assert_redirected_to report_transaction_path(assigns(:report_transaction))
  end

  test "should destroy report_transaction" do
    assert_difference('Report::Transaction.count', -1) do
      delete :destroy, :id => @report_transaction.to_param
    end

    assert_redirected_to report_transactions_path
  end
end
