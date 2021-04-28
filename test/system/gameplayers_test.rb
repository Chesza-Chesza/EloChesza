require "application_system_test_case"

class GameplayersTest < ApplicationSystemTestCase
  setup do
    @gameplayer = gameplayers(:one)
  end

  test "visiting the index" do
    visit gameplayers_url
    assert_selector "h1", text: "Gameplayers"
  end

  test "creating a Gameplayer" do
    visit gameplayers_url
    click_on "New Gameplayer"

    fill_in "Elo", with: @gameplayer.elo
    fill_in "Game", with: @gameplayer.game_id
    fill_in "Player", with: @gameplayer.player_id
    fill_in "Rtng change", with: @gameplayer.rtng_change
    click_on "Create Gameplayer"

    assert_text "Gameplayer was successfully created"
    click_on "Back"
  end

  test "updating a Gameplayer" do
    visit gameplayers_url
    click_on "Edit", match: :first

    fill_in "Elo", with: @gameplayer.elo
    fill_in "Game", with: @gameplayer.game_id
    fill_in "Player", with: @gameplayer.player_id
    fill_in "Rtng change", with: @gameplayer.rtng_change
    click_on "Update Gameplayer"

    assert_text "Gameplayer was successfully updated"
    click_on "Back"
  end

  test "destroying a Gameplayer" do
    visit gameplayers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Gameplayer was successfully destroyed"
  end
end
