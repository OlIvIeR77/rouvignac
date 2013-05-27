require 'test_helper'

class GitesControllerTest < ActionController::TestCase
  setup do
    @gite = gites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gite" do
    assert_difference('Gite.count') do
      post :create, gite: { text10: @gite.text10, text1: @gite.text1, text2: @gite.text2, text3: @gite.text3, text4: @gite.text4, text5: @gite.text5, text6: @gite.text6, text7: @gite.text7, text8: @gite.text8, text9: @gite.text9, title: @gite.title }
    end

    assert_redirected_to gite_path(assigns(:gite))
  end

  test "should show gite" do
    get :show, id: @gite
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gite
    assert_response :success
  end

  test "should update gite" do
    put :update, id: @gite, gite: { text10: @gite.text10, text1: @gite.text1, text2: @gite.text2, text3: @gite.text3, text4: @gite.text4, text5: @gite.text5, text6: @gite.text6, text7: @gite.text7, text8: @gite.text8, text9: @gite.text9, title: @gite.title }
    assert_redirected_to gite_path(assigns(:gite))
  end

  test "should destroy gite" do
    assert_difference('Gite.count', -1) do
      delete :destroy, id: @gite
    end

    assert_redirected_to gites_path
  end
end
