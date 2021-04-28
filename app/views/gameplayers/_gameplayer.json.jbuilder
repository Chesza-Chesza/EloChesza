json.extract! gameplayer, :id, :elo, :rtng_change, :game_id, :player_id, :created_at, :updated_at
json.url gameplayer_url(gameplayer, format: :json)
