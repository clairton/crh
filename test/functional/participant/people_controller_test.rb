require 'test_helper'

class Participant::PeopleControllerTest < ActionController::TestCase
  setup do
    @participant_person = participant_people(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:participant_people)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create participant_person" do
    assert_difference('Participant::Person.count') do
      post :create, :participant_person => @participant_person.attributes
    end

    assert_redirected_to participant_person_path(assigns(:participant_person))
  end

  test "should show participant_person" do
    get :show, :id => @participant_person.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @participant_person.to_param
    assert_response :success
  end

  test "should update participant_person" do
    put :update, :id => @participant_person.to_param, :participant_person => @participant_person.attributes
    assert_redirected_to participant_person_path(assigns(:participant_person))
  end

  test "should destroy participant_person" do
    assert_difference('Participant::Person.count', -1) do
      delete :destroy, :id => @participant_person.to_param
    end

    assert_redirected_to participant_people_path
  end
end
