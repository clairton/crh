require 'test_helper'

class EmailTypesControllerTest < ActionController::TestCase
  setup do
    @email_type = email_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:email_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create email_type" do
    assert_difference('EmailType.count') do
      post :create, :email_type => @email_type.attributes
    end

    assert_redirected_to email_type_path(assigns(:email_type))
  end

  test "should show email_type" do
    get :show, :id => @email_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @email_type.to_param
    assert_response :success
  end

  test "should update email_type" do
    put :update, :id => @email_type.to_param, :email_type => @email_type.attributes
    assert_redirected_to email_type_path(assigns(:email_type))
  end

  test "should destroy email_type" do
    assert_difference('EmailType.count', -1) do
      delete :destroy, :id => @email_type.to_param
    end

    assert_redirected_to email_types_path
  end
end
