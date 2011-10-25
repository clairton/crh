require 'test_helper'

class Participant::Contact::typesControllerTest < ActionController::TestCase
  setup do
    @participant_contact_type = participant_contact_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:participant_contact_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create participant_contact_type" do
    assert_difference('Participant::Contact::type.count') do
      post :create, :participant_contact_type => @participant_contact_type.attributes
    end

    assert_redirected_to participant_contact_type_path(assigns(:participant_contact_type))
  end

  test "should show participant_contact_type" do
    get :show, :id => @participant_contact_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @participant_contact_type.to_param
    assert_response :success
  end

  test "should update participant_contact_type" do
    put :update, :id => @participant_contact_type.to_param, :participant_contact_type => @participant_contact_type.attributes
    assert_redirected_to participant_contact_type_path(assigns(:participant_contact_type))
  end

  test "should destroy participant_contact_type" do
    assert_difference('Participant::Contact::type.count', -1) do
      delete :destroy, :id => @participant_contact_type.to_param
    end

    assert_redirected_to participant_contact_types_path
  end
end
