require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  setup do
    @person = people(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:people)
  end

  test "should get new" do
    sign_in users(:one)
    get :new
    assert_response :success
  end

  test "should create person" do
    sign_in users(:one)
    assert_difference('Person.count') do
      post :create, person: { first_name: @person.first_name, last_name: @person.last_name, location: @person.location }
    end

    assert_redirected_to person_path(assigns(:person))
  end

  test "should show person" do
    get :show, id: @person
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    get :edit, id: @person
    assert_response :success
  end

  test "should update person" do
    sign_in users(:one)
    patch :update, id: @person, person: { first_name: @person.first_name, last_name: @person.last_name, location: @person.location }
    assert_redirected_to person_path(assigns(:person))
  end

  test "should destroy person" do
    sign_in users(:one)
    assert_difference('Person.count', -1) do
      delete :destroy, id: @person
    end

    assert_redirected_to people_path
  end
end
