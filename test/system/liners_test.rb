require "application_system_test_case"

class LinersTest < ApplicationSystemTestCase
  setup do
    @liner = liners(:one)
  end

  test "visiting the index" do
    visit liners_url
    assert_selector "h1", text: "Liners"
  end

  test "creating a Liner" do
    visit liners_url
    click_on "New Liner"

    fill_in "Delivery", with: @liner.delivery_id
    fill_in "Transit", with: @liner.transit_id
    click_on "Create Liner"

    assert_text "Liner was successfully created"
    click_on "Back"
  end

  test "updating a Liner" do
    visit liners_url
    click_on "Edit", match: :first

    fill_in "Delivery", with: @liner.delivery_id
    fill_in "Transit", with: @liner.transit_id
    click_on "Update Liner"

    assert_text "Liner was successfully updated"
    click_on "Back"
  end

  test "destroying a Liner" do
    visit liners_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Liner was successfully destroyed"
  end
end
