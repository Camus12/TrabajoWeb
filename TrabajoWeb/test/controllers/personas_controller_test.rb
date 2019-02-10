require 'test_helper'

class PersonasControllerTest < ActionDispatch::IntegrationTest
  test "should get bajausuario" do
    get personas_bajausuario_url
    assert_response :success
  end

  test "should get edit" do
    get personas_edit_url
    assert_response :success
  end

  test "should get index" do
    get personas_index_url
    assert_response :success
  end

  test "should get new" do
    get personas_new_url
    assert_response :success
  end

  test "should get show" do
    get personas_show_url
    assert_response :success
  end

end
