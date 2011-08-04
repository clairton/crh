require 'test_helper'

class Taxe::GroupsControllerTest < ActionController::TestCase
  setup do
    @taxe_group = taxe_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:taxe_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create taxe_group" do
    assert_difference('Taxe::Group.count') do
      post :create, :taxe_group => @taxe_group.attributes
    end

    assert_redirected_to taxe_group_path(assigns(:taxe_group))
  end

  test "should show taxe_group" do
    get :show, :id => @taxe_group.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @taxe_group.to_param
    assert_response :success
  end

  test "should update taxe_group" do
    put :update, :id => @taxe_group.to_param, :taxe_group => @taxe_group.attributes
    assert_redirected_to taxe_group_path(assigns(:taxe_group))
  end

  test "should destroy taxe_group" do
    assert_difference('Taxe::Group.count', -1) do
      delete :destroy, :id => @taxe_group.to_param
    end

    assert_redirected_to taxe_groups_path
  end
end
