require 'test_helper'

class Email::DomainsControllerTest < ActionController::TestCase
  setup do
    @email_domain = email_domains(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:email_domains)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create email_domain" do
    assert_difference('Email::Domain.count') do
      post :create, :email_domain => @email_domain.attributes
    end

    assert_redirected_to email_domain_path(assigns(:email_domain))
  end

  test "should show email_domain" do
    get :show, :id => @email_domain.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @email_domain.to_param
    assert_response :success
  end

  test "should update email_domain" do
    put :update, :id => @email_domain.to_param, :email_domain => @email_domain.attributes
    assert_redirected_to email_domain_path(assigns(:email_domain))
  end

  test "should destroy email_domain" do
    assert_difference('Email::Domain.count', -1) do
      delete :destroy, :id => @email_domain.to_param
    end

    assert_redirected_to email_domains_path
  end
end
