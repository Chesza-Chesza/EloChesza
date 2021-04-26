require "test_helper"

class TournamentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tournament = tournaments(:one)
  end

  test "should get index" do
    get tournaments_url
    assert_response :success
  end

  test "should get new" do
    get new_tournament_url
    assert_response :success
  end

  test "should create tournament" do
    assert_difference('Tournament.count') do
      post tournaments_url, params: { tournament: { city: @tournament.city, country: @tournament.country, end_date: @tournament.end_date, event_code: @tournament.event_code, name: @tournament.name, players_quantity: @tournament.players_quantity, referee_id: @tournament.referee_id, start_date: @tournament.start_date, system: @tournament.system, time_control: @tournament.time_control, total_rounds: @tournament.total_rounds } }
    end

    assert_redirected_to tournament_url(Tournament.last)
  end

  test "should show tournament" do
    get tournament_url(@tournament)
    assert_response :success
  end

  test "should get edit" do
    get edit_tournament_url(@tournament)
    assert_response :success
  end

  test "should update tournament" do
    patch tournament_url(@tournament), params: { tournament: { city: @tournament.city, country: @tournament.country, end_date: @tournament.end_date, event_code: @tournament.event_code, name: @tournament.name, players_quantity: @tournament.players_quantity, referee_id: @tournament.referee_id, start_date: @tournament.start_date, system: @tournament.system, time_control: @tournament.time_control, total_rounds: @tournament.total_rounds } }
    assert_redirected_to tournament_url(@tournament)
  end

  test "should destroy tournament" do
    assert_difference('Tournament.count', -1) do
      delete tournament_url(@tournament)
    end

    assert_redirected_to tournaments_url
  end
end
