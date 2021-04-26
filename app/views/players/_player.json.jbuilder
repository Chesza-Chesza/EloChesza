json.extract! player, :id, :fide_number, :title, :name, :last_name, :fed, :gender, :b_day, :ranked_player, :elo, :ranked_opponents, :k_value, :last_elo_update, :created_at, :updated_at
json.url player_url(player, format: :json)
