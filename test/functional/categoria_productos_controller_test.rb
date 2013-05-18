require 'test_helper'

class CategoriaProductosControllerTest < ActionController::TestCase
  setup do
    @categoria_producto = categoria_productos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categoria_productos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create categoria_producto" do
    assert_difference('CategoriaProducto.count') do
      post :create, categoria_producto: {  }
    end

    assert_redirected_to categoria_producto_path(assigns(:categoria_producto))
  end

  test "should show categoria_producto" do
    get :show, id: @categoria_producto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @categoria_producto
    assert_response :success
  end

  test "should update categoria_producto" do
    put :update, id: @categoria_producto, categoria_producto: {  }
    assert_redirected_to categoria_producto_path(assigns(:categoria_producto))
  end

  test "should destroy categoria_producto" do
    assert_difference('CategoriaProducto.count', -1) do
      delete :destroy, id: @categoria_producto
    end

    assert_redirected_to categoria_productos_path
  end
end
