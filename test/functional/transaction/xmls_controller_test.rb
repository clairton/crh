require 'test_helper'

class Transaction::XmlsControllerTest < ActionController::TestCase
  setup do
    @transaction_xml = transaction_xmls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transaction_xmls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transaction_xml" do
    assert_difference('Transaction::Xml.count') do
      post :create, :transaction_xml => @transaction_xml.attributes
    end

    assert_redirected_to transaction_xml_path(assigns(:transaction_xml))
  end

  test "should show transaction_xml" do
    get :show, :id => @transaction_xml.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @transaction_xml.to_param
    assert_response :success
  end

  test "should update transaction_xml" do
    put :update, :id => @transaction_xml.to_param, :transaction_xml => @transaction_xml.attributes
    assert_redirected_to transaction_xml_path(assigns(:transaction_xml))
  end

  test "should destroy transaction_xml" do
    assert_difference('Transaction::Xml.count', -1) do
      delete :destroy, :id => @transaction_xml.to_param
    end

    assert_redirected_to transaction_xmls_path
  end
end
