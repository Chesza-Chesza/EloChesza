require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  setup do
    @game = games(:one)
  end

  test "visiting the index" do
    visit games_url
    assert_selector "h1", text: "Games"
  end

  test "creating a Game" do
    visit games_url
    click_on "New Game"

    fill_in "Player1 elo", with: @game.player1_elo
    fill_in "Player1", with: @game.player1_id
    fill_in "Player1 rtng change", with: @game.player1_rtng_change
    fill_in "Player2 elo", with: @game.player2_elo
    fill_in "Player2", with: @game.player2_id
    fill_in "Player2 rtng change", with: @game.player2_rtng_change
    fill_in "Result", with: @game.result
    fill_in "Round", with: @game.round_id
    fill_in "Winner", with: @game.winner
    click_on "Create Game"

    assert_text "Game was successfully created"
    click_on "Back"
  end

  test "updating a Game" do
    visit games_url
    click_on "Edit", match: :first

    fill_in "Player1 elo", with: @game.player1_elo
    fill_in "Player1", with: @game.player1_id
    fill_in "Player1 rtng change", with: @game.player1_rtng_change
    fill_in "Player2 elo", with: @game.player2_elo
    fill_in "Player2", with: @game.player2_id
    fill_in "Player2 rtng change", with: @game.player2_rtng_change
    fill_in "Result", with: @game.result
    fill_in "Round", with: @game.round_id
    fill_in "Winner", with: @game.winner
    click_on "Update Game"

    assert_text "Game was successfully updated"
    click_on "Back"
  end

  test "destroying a Game" do
    visit games_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Game was successfully destroyed"
  end
end
