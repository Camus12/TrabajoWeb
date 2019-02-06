require 'test_helper'

class AlquileresControllerTest < ActionDispatch::IntegrationTest
  test "should get lista" do
    get alquileres_lista_url
    assert_response :success
  end

end
