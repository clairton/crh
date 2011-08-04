require 'test_helper'

class PhonesControllerTest < ActionController::TestCase
  setup do
    @phone = phones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:phones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create phone" do
    assert_difference('Phone.count') do
      post :create, :phone => @phone.attributes
    end

    assert_redirected_to phone_path(assigns(:phone))
  end

  test "should show phone" do
    get :show, :id => @phone.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @phone.to_param
    assert_response :success
  end

  test "should update phone" do
    put :update, :id => @phone.to_param, :phone => @phone.attributes
    assert_redirected_to phone_path(assigns(:phone))
  end

  test "should destroy phone" do
    assert_difference('Phone.count', -1) do
      delete :destroy, :id => @phone.to_param
    end

    assert_redirected_to phones_path
  end
end
