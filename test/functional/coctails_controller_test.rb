require 'test_helper'

class CoctailsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coctails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coctail" do
    assert_difference('Coctail.count') do
      post :create, :coctail => { }
    end

    assert_redirected_to coctail_path(assigns(:coctail))
  end

  test "should show coctail" do
    get :show, :id => coctails(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => coctails(:one).to_param
    assert_response :success
  end

  test "should update coctail" do
    put :update, :id => coctails(:one).to_param, :coctail => { }
    assert_redirected_to coctail_path(assigns(:coctail))
  end

  test "should destroy coctail" do
    assert_difference('Coctail.count', -1) do
      delete :destroy, :id => coctails(:one).to_param
    end

    assert_redirected_to coctails_path
  end
end
