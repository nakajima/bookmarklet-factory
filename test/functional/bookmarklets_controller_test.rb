require 'test_helper'

class BookmarkletsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bookmarklets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bookmarklet" do
    assert_difference('Bookmarklet.count') do
      post :create, :bookmarklet => { }
    end

    assert_redirected_to bookmarklet_path(assigns(:bookmarklet))
  end

  test "should show bookmarklet" do
    get :show, :id => bookmarklets(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => bookmarklets(:one).to_param
    assert_response :success
  end

  test "should update bookmarklet" do
    put :update, :id => bookmarklets(:one).to_param, :bookmarklet => { }
    assert_redirected_to bookmarklet_path(assigns(:bookmarklet))
  end

  test "should destroy bookmarklet" do
    assert_difference('Bookmarklet.count', -1) do
      delete :destroy, :id => bookmarklets(:one).to_param
    end

    assert_redirected_to bookmarklets_path
  end
end
