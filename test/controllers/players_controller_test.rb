require "test_helper"

class PlayersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @player = players(:one)
  end

  test "should get index" do
    get players_url
    assert_response :success
  end

  test "should get new" do
    get new_player_url
    assert_response :success
  end

  test "should create player" do
    assert_difference('Player.count') do
      post players_url, params: { player: { b_day: @player.b_day, elo: @player.elo, fed: @player.fed, fide_number: @player.fide_number, gender: @player.gender, k_value: @player.k_value, last_elo_update: @player.last_elo_update, last_name: @player.last_name, name: @player.name, ranked_opponents: @player.ranked_opponents, ranked_player: @player.ranked_player, title: @player.title } }
    end

    assert_redirected_to player_url(Player.last)
  end

  test "should show player" do
    get player_url(@player)
    assert_response :success
  end

  test "should get edit" do
    get edit_player_url(@player)
    assert_response :success
  end

  test "should update player" do
    patch player_url(@player), params: { player: { b_day: @player.b_day, elo: @player.elo, fed: @player.fed, fide_number: @player.fide_number, gender: @player.gender, k_value: @player.k_value, last_elo_update: @player.last_elo_update, last_name: @player.last_name, name: @player.name, ranked_opponents: @player.ranked_opponents, ranked_player: @player.ranked_player, title: @player.title } }
    assert_redirected_to player_url(@player)
  end

  test "should destroy player" do
    assert_difference('Player.count', -1) do
      delete player_url(@player)
    end

    assert_redirected_to players_url
  end
end
