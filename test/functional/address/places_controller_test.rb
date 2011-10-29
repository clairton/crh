require 'test_helper'

class Address::PlacesControllerTest < ActionController::TestCase
  setup do
    @address_place = address_places(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:address_places)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create address_place" do
    assert_difference('Address::Place.count') do
      post :create, :address_place => @address_place.attributes
    end

    assert_redirected_to address_place_path(assigns(:address_place))
  end

  test "should show address_place" do
    get :show, :id => @address_place.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @address_place.to_param
    assert_response :success
  end

  test "should update address_place" do
    put :update, :id => @address_place.to_param, :address_place => @address_place.attributes
    assert_redirected_to address_place_path(assigns(:address_place))
  end

  test "should destroy address_place" do
    assert_difference('Address::Place.count', -1) do
      delete :destroy, :id => @address_place.to_param
    end

    assert_redirected_to address_places_path
  end
end
