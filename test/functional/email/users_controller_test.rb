require 'test_helper'

class Email::UsersControllerTest < ActionController::TestCase
  setup do
    @email_user = email_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:email_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create email_user" do
    assert_difference('Email::User.count') do
      post :create, :email_user => @email_user.attributes
    end

    assert_redirected_to email_user_path(assigns(:email_user))
  end

  test "should show email_user" do
    get :show, :id => @email_user.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @email_user.to_param
    assert_response :success
  end

  test "should update email_user" do
    put :update, :id => @email_user.to_param, :email_user => @email_user.attributes
    assert_redirected_to email_user_path(assigns(:email_user))
  end

  test "should destroy email_user" do
    assert_difference('Email::User.count', -1) do
      delete :destroy, :id => @email_user.to_param
    end

    assert_redirected_to email_users_path
  end
end
