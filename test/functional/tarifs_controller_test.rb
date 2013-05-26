require 'test_helper'

class TarifsControllerTest < ActionController::TestCase
  setup do
    @tarif = tarifs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tarifs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tarif" do
    assert_difference('Tarif.count') do
      post :create, tarif: { prixa1: @tarif.prixa1, prixa2: @tarif.prixa2, prixa3: @tarif.prixa3, prixb1: @tarif.prixb1, prixb2: @tarif.prixb2, prixb3: @tarif.prixb3, prixc1: @tarif.prixc1, prixc2: @tarif.prixc2, prixc3: @tarif.prixc3, prixd1: @tarif.prixd1, prixd2: @tarif.prixd2, prixd3: @tarif.prixd3, prixe1: @tarif.prixe1, prixe2: @tarif.prixe2, prixe3: @tarif.prixe3, prixf1: @tarif.prixf1, prixf2: @tarif.prixf2, prixf3: @tarif.prixf3, prixg1: @tarif.prixg1, prixg2: @tarif.prixg2, prixg3: @tarif.prixg3, prixh1: @tarif.prixh1, prixh2: @tarif.prixh2, prixh3: @tarif.prixh3, prixi1: @tarif.prixi1, prixi2: @tarif.prixi2, prixi3: @tarif.prixi3, prixj1: @tarif.prixj1, prixj2: @tarif.prixj2, prixj3: @tarif.prixj3, prixk1: @tarif.prixk1, prixk2: @tarif.prixk2, prixk3: @tarif.prixk3, prixl1: @tarif.prixl1, prixl2: @tarif.prixl2, prixl3: @tarif.prixl3, year: @tarif.year }
    end

    assert_redirected_to tarif_path(assigns(:tarif))
  end

  test "should show tarif" do
    get :show, id: @tarif
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tarif
    assert_response :success
  end

  test "should update tarif" do
    put :update, id: @tarif, tarif: { prixa1: @tarif.prixa1, prixa2: @tarif.prixa2, prixa3: @tarif.prixa3, prixb1: @tarif.prixb1, prixb2: @tarif.prixb2, prixb3: @tarif.prixb3, prixc1: @tarif.prixc1, prixc2: @tarif.prixc2, prixc3: @tarif.prixc3, prixd1: @tarif.prixd1, prixd2: @tarif.prixd2, prixd3: @tarif.prixd3, prixe1: @tarif.prixe1, prixe2: @tarif.prixe2, prixe3: @tarif.prixe3, prixf1: @tarif.prixf1, prixf2: @tarif.prixf2, prixf3: @tarif.prixf3, prixg1: @tarif.prixg1, prixg2: @tarif.prixg2, prixg3: @tarif.prixg3, prixh1: @tarif.prixh1, prixh2: @tarif.prixh2, prixh3: @tarif.prixh3, prixi1: @tarif.prixi1, prixi2: @tarif.prixi2, prixi3: @tarif.prixi3, prixj1: @tarif.prixj1, prixj2: @tarif.prixj2, prixj3: @tarif.prixj3, prixk1: @tarif.prixk1, prixk2: @tarif.prixk2, prixk3: @tarif.prixk3, prixl1: @tarif.prixl1, prixl2: @tarif.prixl2, prixl3: @tarif.prixl3, year: @tarif.year }
    assert_redirected_to tarif_path(assigns(:tarif))
  end

  test "should destroy tarif" do
    assert_difference('Tarif.count', -1) do
      delete :destroy, id: @tarif
    end

    assert_redirected_to tarifs_path
  end
end
