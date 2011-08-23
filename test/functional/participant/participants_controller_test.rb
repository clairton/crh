require 'test_helper'

class Participant::ParticipantsControllerTest < ActionController::TestCase
  setup do
    @participant_participant = participant_participants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:participant_participants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create participant_participant" do
    assert_difference('Participant::Participant.count') do
      post :create, :participant_participant => @participant_participant.attributes
    end

    assert_redirected_to participant_participant_path(assigns(:participant_participant))
  end

  test "should show participant_participant" do
    get :show, :id => @participant_participant.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @participant_participant.to_param
    assert_response :success
  end

  test "should update participant_participant" do
    put :update, :id => @participant_participant.to_param, :participant_participant => @participant_participant.attributes
    assert_redirected_to participant_participant_path(assigns(:participant_participant))
  end

  test "should destroy participant_participant" do
    assert_difference('Participant::Participant.count', -1) do
      delete :destroy, :id => @participant_participant.to_param
    end

    assert_redirected_to participant_participants_path
  end
end
