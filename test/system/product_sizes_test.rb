require "application_system_test_case"

class ProductSizesTest < ApplicationSystemTestCase
  setup do
    @product_size = product_sizes(:one)
  end

  test "visiting the index" do
    visit product_sizes_url
    assert_selector "h1", text: "Product Sizes"
  end

  test "creating a Product size" do
    visit product_sizes_url
    click_on "New Product Size"

    fill_in "Collection", with: @product_size.collection_id
    fill_in "Name", with: @product_size.name
    click_on "Create Product size"

    assert_text "Product size was successfully created"
    click_on "Back"
  end

  test "updating a Product size" do
    visit product_sizes_url
    click_on "Edit", match: :first

    fill_in "Collection", with: @product_size.collection_id
    fill_in "Name", with: @product_size.name
    click_on "Update Product size"

    assert_text "Product size was successfully updated"
    click_on "Back"
  end

  test "destroying a Product size" do
    visit product_sizes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product size was successfully destroyed"
  end
end
