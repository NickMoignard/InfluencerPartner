require "application_system_test_case"

class ProductTagsTest < ApplicationSystemTestCase
  setup do
    @product_tag = product_tags(:one)
  end

  test "visiting the index" do
    visit product_tags_url
    assert_selector "h1", text: "Product Tags"
  end

  test "creating a Product tag" do
    visit product_tags_url
    click_on "New Product Tag"

    fill_in "Tag", with: @product_tag.tag
    click_on "Create Product tag"

    assert_text "Product tag was successfully created"
    click_on "Back"
  end

  test "updating a Product tag" do
    visit product_tags_url
    click_on "Edit", match: :first

    fill_in "Tag", with: @product_tag.tag
    click_on "Update Product tag"

    assert_text "Product tag was successfully updated"
    click_on "Back"
  end

  test "destroying a Product tag" do
    visit product_tags_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product tag was successfully destroyed"
  end
end
