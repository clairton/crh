require 'test_helper'

class Participant::Contact::AddressesControllerTest < ActionController::TestCase
  setup do
    @participant_contact_address = participant_contact_addresses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:participant_contact_addresses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create participant_contact_address" do
    assert_difference('Participant::Contact::Address.count') do
      post :create, :participant_contact_address => @participant_contact_address.attributes
    end

    assert_redirected_to participant_contact_address_path(assigns(:participant_contact_address))
  end

  test "should show participant_contact_address" do
    get :show, :id => @participant_contact_address.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @participant_contact_address.to_param
    assert_response :success
  end

  test "should update participant_contact_address" do
    put :update, :id => @participant_contact_address.to_param, :participant_contact_address => @participant_contact_address.attributes
    assert_redirected_to participant_contact_address_path(assigns(:participant_contact_address))
  end

  test "should destroy participant_contact_address" do
    assert_difference('Participant::Contact::Address.count', -1) do
      delete :destroy, :id => @participant_contact_address.to_param
    end

    assert_redirected_to participant_contact_addresses_path
  end
end
