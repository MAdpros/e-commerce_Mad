require "application_system_test_case"

class TransitsTest < ApplicationSystemTestCase
  setup do
    @transit = transits(:one)
  end

  test "visiting the index" do
    visit transits_url
    assert_selector "h1", text: "Transits"
  end

  test "creating a Transit" do
    visit transits_url
    click_on "New Transit"

    fill_in "Mode", with: @transit.mode
    fill_in "Name", with: @transit.name
    fill_in "Price", with: @transit.price
    click_on "Create Transit"

    assert_text "Transit was successfully created"
    click_on "Back"
  end

  test "updating a Transit" do
    visit transits_url
    click_on "Edit", match: :first

    fill_in "Mode", with: @transit.mode
    fill_in "Name", with: @transit.name
    fill_in "Price", with: @transit.price
    click_on "Update Transit"

    assert_text "Transit was successfully updated"
    click_on "Back"
  end

  test "destroying a Transit" do
    visit transits_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Transit was successfully destroyed"
  end
end
