require 'test_helper'

class Financier::NotesControllerTest < ActionController::TestCase
  setup do
    @financier_note = financier_notes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:financier_notes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create financier_note" do
    assert_difference('Financier::Note.count') do
      post :create, :financier_note => @financier_note.attributes
    end

    assert_redirected_to financier_note_path(assigns(:financier_note))
  end

  test "should show financier_note" do
    get :show, :id => @financier_note.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @financier_note.to_param
    assert_response :success
  end

  test "should update financier_note" do
    put :update, :id => @financier_note.to_param, :financier_note => @financier_note.attributes
    assert_redirected_to financier_note_path(assigns(:financier_note))
  end

  test "should destroy financier_note" do
    assert_difference('Financier::Note.count', -1) do
      delete :destroy, :id => @financier_note.to_param
    end

    assert_redirected_to financier_notes_path
  end
end
