json.extract! tournament, :id, :event_code, :name, :city, :country, :players_quantity, :start_date, :end_date, :total_rounds, :system, :time_control, :referee_id, :created_at, :updated_at
json.url tournament_url(tournament, format: :json)
