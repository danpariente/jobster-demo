require 'test_helper'

class GroupsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get leave" do
    get :leave
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get add" do
    get :add
    assert_response :success
  end

end
