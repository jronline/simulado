require 'test_helper'

class UserExamsControllerTest < ActionController::TestCase
  setup do
    @user_exam = user_exams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_exams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_exam" do
    assert_difference('UserExam.count') do
      post :create, user_exam: { area_id: @user_exam.area_id, date_application: @user_exam.date_application, title: @user_exam.title, user_id: @user_exam.user_id }
    end

    assert_redirected_to user_exam_path(assigns(:user_exam))
  end

  test "should show user_exam" do
    get :show, id: @user_exam
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_exam
    assert_response :success
  end

  test "should update user_exam" do
    patch :update, id: @user_exam, user_exam: { area_id: @user_exam.area_id, date_application: @user_exam.date_application, title: @user_exam.title, user_id: @user_exam.user_id }
    assert_redirected_to user_exam_path(assigns(:user_exam))
  end

  test "should destroy user_exam" do
    assert_difference('UserExam.count', -1) do
      delete :destroy, id: @user_exam
    end

    assert_redirected_to user_exams_path
  end
end
