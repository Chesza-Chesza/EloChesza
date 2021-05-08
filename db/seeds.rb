Referee.destroy_all
Tournament.destroy_all
Player.destroy_all
Round.destroy_all
Game.destroy_all
Gameplayer.destroy_all

Referee.create!([{ id: 1, name: 'Alexis Murillo', fide_id: 5678, title: 1 }])

Tournament.create!([{ id: 1, event_code: 2541, name: 'SJ Open', city: 'San José', country: 'CRC', players_quantity: 8, system: 1, start_date: '12-12-2021', end_date: '12-24-2021', total_rounds: 3, time_control: 1 , referee_id: 1 }])

Round.create!([
  { id: 1, date: '12-12-2021', number: 1, tournament_id: 1 },
  { id: 2, date: '13-12-2021', number: 2, tournament_id: 1 },
  { id: 3, date: '14-12-2021', number: 3, tournament_id: 1 }
])

Player.create!([
  { fide_number: 1503014, title: 1, first_name: 'Magnus', last_name: 'Carlsen', fed: 'NOR', elo: 2847, b_day: '01-01-1990', gender: 1, ranked_player: true, k_value: 20, last_elo_update:'04-26-2021' },
  { fide_number: 2020009, title: 1, first_name: 'Fabiano', last_name: 'Caruana', fed: 'USA', elo: 2820, b_day: '01-01-1992', gender: 1, ranked_player: true, k_value: 20, last_elo_update:'04-26-2021' },
  { fide_number: 8603677, title: 1, first_name: 'Liren', last_name: 'Ding', fed: 'CHN', elo: 2791, b_day: '01-01-1992', gender: 1, ranked_player: true, k_value: 20, last_elo_update:'04-26-2021' },
  { fide_number: 4168119, title: 1, first_name: 'Ian', last_name: 'Nepomniachtchi', fed: 'RUS', elo: 2789, b_day: '01-01-1990', gender: 1, ranked_player: true, k_value: 20, last_elo_update:'04-26-2021' },
  { fide_number: 13300474, title: 1, first_name: 'Levon', last_name: 'Aronian', fed: 'ARM', elo: 2781, b_day: '01-01-1982', gender: 1, ranked_player: true, k_value: 20, last_elo_update:'04-26-2021' },
  { fide_number: 4126025, title: 1, first_name: 'Alexander', last_name: 'Grischuk', fed: 'RUS', elo: 2777, b_day: '01-01-1983', gender: 1, ranked_player: true, k_value: 20, last_elo_update:'04-26-2021' },
  { fide_number: 24116068, title: 1, first_name: 'Anish', last_name: 'Giri', fed: 'NED', elo: 2776, b_day: '01-01-1994', gender: 1, ranked_player: true, k_value: 20, last_elo_update:'04-26-2021' },
  { fide_number: 13401319, title: 1, first_name: 'Shakhriyar', last_name: 'Mamedyarov', fed: 'AZE', elo: 2770, b_day: '01-01-1985', gender: 1, ranked_player: true, k_value: 20, last_elo_update:'04-26-2021' }
])

Dir[File.join(Rails.root, 'db', 'seeds', '*.rb' )].sort.each { |seed| load seed }

Game.create!([
  { id: 1, player1_id: 1, player2_id: 5, result: 1, winner: 1, round_id: 1 },
  { id: 2, player1_id: 2, player2_id: 6, result: 1, winner: 2, round_id: 1 },
  { id: 3, player1_id: 3, player2_id: 7, result: 1, winner: 3, round_id: 1 },
  { id: 4, player1_id: 4, player2_id: 8, result: 1, winner: 4, round_id: 1 },
  { id: 5, player1_id: 1, player2_id: 3, result: 1, winner: 1, round_id: 2 },
  { id: 6, player1_id: 2, player2_id: 4, result: 1, winner: 2, round_id: 2 },
  { id: 7, player1_id: 1, player2_id: 2, result: 1, winner: 1, round_id: 3 }
])

Gameplayer.create!([
  { player_id: 1, game_id: 1 },
  { player_id: 1, game_id: 5 },
  { player_id: 1, game_id: 7 },
  { player_id: 2, game_id: 2 },
  { player_id: 2, game_id: 6 },
  { player_id: 2, game_id: 7 },
  { player_id: 3, game_id: 3 },
  { player_id: 3, game_id: 5 },
  { player_id: 4, game_id: 4 },
  { player_id: 4, game_id: 6 },
  { player_id: 5, game_id: 1 },
  { player_id: 6, game_id: 2 },
  { player_id: 7, game_id: 3 },
  { player_id: 8, game_id: 4 }
])