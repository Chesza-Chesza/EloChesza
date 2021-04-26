require "application_system_test_case"

class RefereesTest < ApplicationSystemTestCase
  setup do
    @referee = referees(:one)
  end

  test "visiting the index" do
    visit referees_url
    assert_selector "h1", text: "Referees"
  end

  test "creating a Referee" do
    visit referees_url
    click_on "New Referee"

    fill_in "Fide", with: @referee.fide_id
    fill_in "Name", with: @referee.name
    fill_in "Title", with: @referee.title
    click_on "Create Referee"

    assert_text "Referee was successfully created"
    click_on "Back"
  end

  test "updating a Referee" do
    visit referees_url
    click_on "Edit", match: :first

    fill_in "Fide", with: @referee.fide_id
    fill_in "Name", with: @referee.name
    fill_in "Title", with: @referee.title
    click_on "Update Referee"

    assert_text "Referee was successfully updated"
    click_on "Back"
  end

  test "destroying a Referee" do
    visit referees_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Referee was successfully destroyed"
  end
end
