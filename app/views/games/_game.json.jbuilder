json.extract! game, :id, :player1_id, :player1_elo, :player2_id, :player2_elo, :result, :won, :player1_rtng_change, :player2_rtng_change, :round_id, :created_at, :updated_at
json.url game_url(game, format: :json)
