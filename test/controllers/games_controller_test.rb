require "test_helper"

class GamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game = games(:one)
  end

  test "should get index" do
    get games_url
    assert_response :success
  end

  test "should get new" do
    get new_game_url
    assert_response :success
  end

  test "should create game" do
    assert_difference('Game.count') do
      post games_url, params: { game: { player1_elo: @game.player1_elo, player1_id: @game.player1_id, player1_rtng_change: @game.player1_rtng_change, player2_elo: @game.player2_elo, player2_id: @game.player2_id, player2_rtng_change: @game.player2_rtng_change, result: @game.result, round_id: @game.round_id, won: @game.won } }
    end

    assert_redirected_to game_url(Game.last)
  end

  test "should show game" do
    get game_url(@game)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_url(@game)
    assert_response :success
  end

  test "should update game" do
    patch game_url(@game), params: { game: { player1_elo: @game.player1_elo, player1_id: @game.player1_id, player1_rtng_change: @game.player1_rtng_change, player2_elo: @game.player2_elo, player2_id: @game.player2_id, player2_rtng_change: @game.player2_rtng_change, result: @game.result, round_id: @game.round_id, won: @game.won } }
    assert_redirected_to game_url(@game)
  end

  test "should destroy game" do
    assert_difference('Game.count', -1) do
      delete game_url(@game)
    end

    assert_redirected_to games_url
  end
end
