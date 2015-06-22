require 'test_helper'

class TodosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get complete" do
    get :complete
    assert_response :success
  end

  test "should get add" do
    get :add
    assert_response :success
  end

end
