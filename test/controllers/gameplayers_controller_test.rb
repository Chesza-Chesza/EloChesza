require "test_helper"

class GameplayersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gameplayer = gameplayers(:one)
  end

  test "should get index" do
    get gameplayers_url
    assert_response :success
  end

  test "should get new" do
    get new_gameplayer_url
    assert_response :success
  end

  test "should create gameplayer" do
    assert_difference('Gameplayer.count') do
      post gameplayers_url, params: { gameplayer: { elo: @gameplayer.elo, game_id: @gameplayer.game_id, player_id: @gameplayer.player_id, rtng_change: @gameplayer.rtng_change } }
    end

    assert_redirected_to gameplayer_url(Gameplayer.last)
  end

  test "should show gameplayer" do
    get gameplayer_url(@gameplayer)
    assert_response :success
  end

  test "should get edit" do
    get edit_gameplayer_url(@gameplayer)
    assert_response :success
  end

  test "should update gameplayer" do
    patch gameplayer_url(@gameplayer), params: { gameplayer: { elo: @gameplayer.elo, game_id: @gameplayer.game_id, player_id: @gameplayer.player_id, rtng_change: @gameplayer.rtng_change } }
    assert_redirected_to gameplayer_url(@gameplayer)
  end

  test "should destroy gameplayer" do
    assert_difference('Gameplayer.count', -1) do
      delete gameplayer_url(@gameplayer)
    end

    assert_redirected_to gameplayers_url
  end
end
