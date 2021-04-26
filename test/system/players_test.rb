require "application_system_test_case"

class PlayersTest < ApplicationSystemTestCase
  setup do
    @player = players(:one)
  end

  test "visiting the index" do
    visit players_url
    assert_selector "h1", text: "Players"
  end

  test "creating a Player" do
    visit players_url
    click_on "New Player"

    fill_in "B day", with: @player.b_day
    fill_in "Elo", with: @player.elo
    fill_in "Fed", with: @player.fed
    fill_in "Fide number", with: @player.fide_number
    fill_in "Gender", with: @player.gender
    fill_in "K value", with: @player.k_value
    fill_in "Last elo update", with: @player.last_elo_update
    fill_in "Last name", with: @player.last_name
    fill_in "Name", with: @player.name
    fill_in "Ranked opponents", with: @player.ranked_opponents
    check "Ranked player" if @player.ranked_player
    fill_in "Title", with: @player.title
    click_on "Create Player"

    assert_text "Player was successfully created"
    click_on "Back"
  end

  test "updating a Player" do
    visit players_url
    click_on "Edit", match: :first

    fill_in "B day", with: @player.b_day
    fill_in "Elo", with: @player.elo
    fill_in "Fed", with: @player.fed
    fill_in "Fide number", with: @player.fide_number
    fill_in "Gender", with: @player.gender
    fill_in "K value", with: @player.k_value
    fill_in "Last elo update", with: @player.last_elo_update
    fill_in "Last name", with: @player.last_name
    fill_in "Name", with: @player.name
    fill_in "Ranked opponents", with: @player.ranked_opponents
    check "Ranked player" if @player.ranked_player
    fill_in "Title", with: @player.title
    click_on "Update Player"

    assert_text "Player was successfully updated"
    click_on "Back"
  end

  test "destroying a Player" do
    visit players_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Player was successfully destroyed"
  end
end
