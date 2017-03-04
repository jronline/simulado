require 'test_helper'

class HelperObjectsControllerTest < ActionController::TestCase
  setup do
    @helper_object = helper_objects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:helper_objects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create helper_object" do
    assert_difference('HelperObject.count') do
      post :create, helper_object: { font: @helper_object.font, question_id: @helper_object.question_id, text: @helper_object.text, title: @helper_object.title }
    end

    assert_redirected_to helper_object_path(assigns(:helper_object))
  end

  test "should show helper_object" do
    get :show, id: @helper_object
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @helper_object
    assert_response :success
  end

  test "should update helper_object" do
    patch :update, id: @helper_object, helper_object: { font: @helper_object.font, question_id: @helper_object.question_id, text: @helper_object.text, title: @helper_object.title }
    assert_redirected_to helper_object_path(assigns(:helper_object))
  end

  test "should destroy helper_object" do
    assert_difference('HelperObject.count', -1) do
      delete :destroy, id: @helper_object
    end

    assert_redirected_to helper_objects_path
  end
end
