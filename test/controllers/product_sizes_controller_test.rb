require 'test_helper'

class ProductSizesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_size = product_sizes(:one)
  end

  test "should get index" do
    get product_sizes_url
    assert_response :success
  end

  test "should get new" do
    get new_product_size_url
    assert_response :success
  end

  test "should create product_size" do
    assert_difference('ProductSize.count') do
      post product_sizes_url, params: { product_size: { collection_id: @product_size.collection_id, name: @product_size.name } }
    end

    assert_redirected_to product_size_url(ProductSize.last)
  end

  test "should show product_size" do
    get product_size_url(@product_size)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_size_url(@product_size)
    assert_response :success
  end

  test "should update product_size" do
    patch product_size_url(@product_size), params: { product_size: { collection_id: @product_size.collection_id, name: @product_size.name } }
    assert_redirected_to product_size_url(@product_size)
  end

  test "should destroy product_size" do
    assert_difference('ProductSize.count', -1) do
      delete product_size_url(@product_size)
    end

    assert_redirected_to product_sizes_url
  end
end
