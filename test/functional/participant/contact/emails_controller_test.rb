require 'test_helper'

class Participant::Contact::EmailsControllerTest < ActionController::TestCase
  setup do
    @participant_contact_email = participant_contact_emails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:participant_contact_emails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create participant_contact_email" do
    assert_difference('Participant::Contact::Email.count') do
      post :create, :participant_contact_email => @participant_contact_email.attributes
    end

    assert_redirected_to participant_contact_email_path(assigns(:participant_contact_email))
  end

  test "should show participant_contact_email" do
    get :show, :id => @participant_contact_email.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @participant_contact_email.to_param
    assert_response :success
  end

  test "should update participant_contact_email" do
    put :update, :id => @participant_contact_email.to_param, :participant_contact_email => @participant_contact_email.attributes
    assert_redirected_to participant_contact_email_path(assigns(:participant_contact_email))
  end

  test "should destroy participant_contact_email" do
    assert_difference('Participant::Contact::Email.count', -1) do
      delete :destroy, :id => @participant_contact_email.to_param
    end

    assert_redirected_to participant_contact_emails_path
  end
end
