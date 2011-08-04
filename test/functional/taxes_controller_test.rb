require 'test_helper'

class TaxesControllerTest < ActionController::TestCase
  setup do
    @taxis = taxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:taxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create taxis" do
    assert_difference('Taxe.count') do
      post :create, :taxis => @taxis.attributes
    end

    assert_redirected_to taxis_path(assigns(:taxis))
  end

  test "should show taxis" do
    get :show, :id => @taxis.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @taxis.to_param
    assert_response :success
  end

  test "should update taxis" do
    put :update, :id => @taxis.to_param, :taxis => @taxis.attributes
    assert_redirected_to taxis_path(assigns(:taxis))
  end

  test "should destroy taxis" do
    assert_difference('Taxe.count', -1) do
      delete :destroy, :id => @taxis.to_param
    end

    assert_redirected_to taxes_path
  end
end
