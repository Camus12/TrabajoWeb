require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get vista" do
    get home_vista_url
    assert_response :success
  end

  test "should get login" do
    get home_login_url
    assert_response :success
  end

  test "should get registro" do
    get home_registro_url
    assert_response :success
  end

  test "should get bajausuario" do
    get home_bajausuario_url
    assert_response :success
  end

  test "should get actualizaciondeusuario" do
    get home_actualizaciondeusuario_url
    assert_response :success
  end

end
