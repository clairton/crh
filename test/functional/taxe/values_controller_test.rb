require 'test_helper'

class Taxe::valuesControllerTest < ActionController::TestCase
  setup do
    @taxe_value = taxe_values(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:taxe_values)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create taxe_value" do
    assert_difference('Taxe::value.count') do
      post :create, :taxe_value => @taxe_value.attributes
    end

    assert_redirected_to taxe_value_path(assigns(:taxe_value))
  end

  test "should show taxe_value" do
    get :show, :id => @taxe_value.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @taxe_value.to_param
    assert_response :success
  end

  test "should update taxe_value" do
    put :update, :id => @taxe_value.to_param, :taxe_value => @taxe_value.attributes
    assert_redirected_to taxe_value_path(assigns(:taxe_value))
  end

  test "should destroy taxe_value" do
    assert_difference('Taxe::value.count', -1) do
      delete :destroy, :id => @taxe_value.to_param
    end

    assert_redirected_to taxe_values_path
  end
end
