require 'test_helper'

class PersonTypesControllerTest < ActionController::TestCase
  setup do
    @person_type = person_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:person_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create person_type" do
    assert_difference('PersonType.count') do
      post :create, :person_type => @person_type.attributes
    end

    assert_redirected_to person_type_path(assigns(:person_type))
  end

  test "should show person_type" do
    get :show, :id => @person_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @person_type.to_param
    assert_response :success
  end

  test "should update person_type" do
    put :update, :id => @person_type.to_param, :person_type => @person_type.attributes
    assert_redirected_to person_type_path(assigns(:person_type))
  end

  test "should destroy person_type" do
    assert_difference('PersonType.count', -1) do
      delete :destroy, :id => @person_type.to_param
    end

    assert_redirected_to person_types_path
  end
end
