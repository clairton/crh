require 'test_helper'

class Taxe::typesControllerTest < ActionController::TestCase
  setup do
    @taxe_type = taxe_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:taxe_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create taxe_type" do
    assert_difference('Taxe::type.count') do
      post :create, :taxe_type => @taxe_type.attributes
    end

    assert_redirected_to taxe_type_path(assigns(:taxe_type))
  end

  test "should show taxe_type" do
    get :show, :id => @taxe_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @taxe_type.to_param
    assert_response :success
  end

  test "should update taxe_type" do
    put :update, :id => @taxe_type.to_param, :taxe_type => @taxe_type.attributes
    assert_redirected_to taxe_type_path(assigns(:taxe_type))
  end

  test "should destroy taxe_type" do
    assert_difference('Taxe::type.count', -1) do
      delete :destroy, :id => @taxe_type.to_param
    end

    assert_redirected_to taxe_types_path
  end
end
