require 'test_helper'

class GauchadasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gauchada = gauchadas(:one)
  end

  test "should get index" do
    get gauchadas_url
    assert_response :success
  end

  test "should get new" do
    get new_gauchada_url
    assert_response :success
  end

  test "should create gauchada" do
    assert_difference('Gauchada.count') do
      post gauchadas_url, params: { gauchada: { categoria: @gauchada.categoria, descripcion: @gauchada.descripcion, estado: @gauchada.estado, fecha_de_inicio: @gauchada.fecha_de_inicio, fecha_limite: @gauchada.fecha_limite, nombre: @gauchada.nombre, title: @gauchada.title } }
    end

    assert_redirected_to gauchada_url(Gauchada.last)
  end

  test "should show gauchada" do
    get gauchada_url(@gauchada)
    assert_response :success
  end

  test "should get edit" do
    get edit_gauchada_url(@gauchada)
    assert_response :success
  end

  test "should update gauchada" do
    patch gauchada_url(@gauchada), params: { gauchada: { categoria: @gauchada.categoria, descripcion: @gauchada.descripcion, estado: @gauchada.estado, fecha_de_inicio: @gauchada.fecha_de_inicio, fecha_limite: @gauchada.fecha_limite, nombre: @gauchada.nombre, title: @gauchada.title } }
    assert_redirected_to gauchada_url(@gauchada)
  end

  test "should destroy gauchada" do
    assert_difference('Gauchada.count', -1) do
      delete gauchada_url(@gauchada)
    end

    assert_redirected_to gauchadas_url
  end
end
