require 'test_helper'

class EstacionamientosControllerTest < ActionDispatch::IntegrationTest
  test "should get edicion" do
    get estacionamientos_edicion_url
    assert_response :success
  end

  test "should get lista" do
    get estacionamientos_lista_url
    assert_response :success
  end

end
