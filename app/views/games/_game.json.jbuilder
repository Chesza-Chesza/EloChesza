json.extract! game, :id, :player1_id, :player2_id, :result, :winner, :round_id, :created_at, :updated_at
json.url game_url(game, format: :json)
