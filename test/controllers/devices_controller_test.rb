require 'test_helper'

class DevicesControllerTest < ActionController::TestCase
  setup do
    @device = { tag: 9, name: "test9" }
    @one = devices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:devices)
  end

  test "should get new" do
    sign_in users(:one)
    get :new
    assert_response :success
  end

  test "should create device" do
    sign_in users(:one)
    assert_difference('Device.count') do
      post :create, device: @device
    end

    assert_redirected_to device_path(assigns(:device))
  end

  test "should show device" do
    get :show, id: @one
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    get :edit, id: @one
    assert_response :success
  end

  test "should update device" do
    sign_in users(:one)
    patch :update, id: @one, device: { tag: @one.tag, name: @one.name }
    assert_redirected_to device_path(assigns(:device))
  end

  test "should destroy device" do
    sign_in users(:one)
    assert_difference('Device.count', -1) do
      delete :destroy, id: @one
    end

    assert_redirected_to devices_path
  end
end
