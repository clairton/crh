require 'test_helper'

class Transaction::ParticipantsControllerTest < ActionController::TestCase
  setup do
    @transaction_participant = transaction_participants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transaction_participants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transaction_participant" do
    assert_difference('Transaction::Participant.count') do
      post :create, :transaction_participant => @transaction_participant.attributes
    end

    assert_redirected_to transaction_participant_path(assigns(:transaction_participant))
  end

  test "should show transaction_participant" do
    get :show, :id => @transaction_participant.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @transaction_participant.to_param
    assert_response :success
  end

  test "should update transaction_participant" do
    put :update, :id => @transaction_participant.to_param, :transaction_participant => @transaction_participant.attributes
    assert_redirected_to transaction_participant_path(assigns(:transaction_participant))
  end

  test "should destroy transaction_participant" do
    assert_difference('Transaction::Participant.count', -1) do
      delete :destroy, :id => @transaction_participant.to_param
    end

    assert_redirected_to transaction_participants_path
  end
end
