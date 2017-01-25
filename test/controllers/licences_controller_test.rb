require 'test_helper'

class LicencesControllerTest < ActionController::TestCase
  setup do
    @licence = { vendor: "vendor1", app_name: "app1", version: "v1", edition: "pro", in_use: false }
    @one = licences(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:licences)
  end

  test "should get new" do
    sign_in users(:one)
    get :new
    assert_response :success
  end

  test "should create licence" do
    sign_in users(:one)
    assert_difference('Licence.count') do
      post :create, licence: @licence
    end

    assert_redirected_to licence_path(assigns(:licence))
  end

  test "should show licence" do
    get :show, id: @one
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    get :edit, id: @one
    assert_response :success
  end

  test "should update licence" do
    sign_in users(:one)
    patch :update, id: @one, licence: { vendor: @one.vendor, app_name: @one.app_name, version: @one.version, edition: @one.edition, in_use: @one.in_use }
    assert_redirected_to licence_path(assigns(:licence))
  end

  test "should destroy licence" do
    sign_in users(:one)
    assert_difference('Licence.count', -1) do
      delete :destroy, id: @one
    end

    assert_redirected_to licences_path
  end
end
