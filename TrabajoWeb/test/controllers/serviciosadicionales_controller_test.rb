require 'test_helper'

class ServiciosadicionalesControllerTest < ActionDispatch::IntegrationTest
  test "should get edicion" do
    get serviciosadicionales_edicion_url
    assert_response :success
  end

  test "should get lista" do
    get serviciosadicionales_lista_url
    assert_response :success
  end

  test "should get estacedicion" do
    get serviciosadicionales_estacedicion_url
    assert_response :success
  end

  test "should get estaclista" do
    get serviciosadicionales_estaclista_url
    assert_response :success
  end

end
