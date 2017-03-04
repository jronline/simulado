require 'test_helper'

class MocksControllerTest < ActionController::TestCase
  setup do
    @mock = mocks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mocks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mock" do
    assert_difference('Mock.count') do
      post :create, mock: { application_date: @mock.application_date, area_id: @mock.area_id, category_id: @mock.category_id, edition: @mock.edition, institution_id: @mock.institution_id, notice: @mock.notice, organizer_id: @mock.organizer_id, title: @mock.title, year: @mock.year }
    end

    assert_redirected_to mock_path(assigns(:mock))
  end

  test "should show mock" do
    get :show, id: @mock
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mock
    assert_response :success
  end

  test "should update mock" do
    patch :update, id: @mock, mock: { application_date: @mock.application_date, area_id: @mock.area_id, category_id: @mock.category_id, edition: @mock.edition, institution_id: @mock.institution_id, notice: @mock.notice, organizer_id: @mock.organizer_id, title: @mock.title, year: @mock.year }
    assert_redirected_to mock_path(assigns(:mock))
  end

  test "should destroy mock" do
    assert_difference('Mock.count', -1) do
      delete :destroy, id: @mock
    end

    assert_redirected_to mocks_path
  end
end
