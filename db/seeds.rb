Referee.destroy_all
Tournament.destroy_all
Player.destroy_all
Round.destroy_all
Game.destroy_all

Referee.create!([{ name: 'Alexis Murillo', fide_id: 5678, title: 1 }])

Tournament.create!([{ event_code: 2541, name: 'SJ Open', city: 'San José', country: 'CRC', players_quantity: 8, system: 1, start_date: '12-12-2021', end_date: '12-24-2021', total_rounds: 7, time_control: 1 , referee_id: 1 }])

Round.create!([{ date: '12-12-2021', match_number: 1, tournament_id: 1 }])

Player.create!([
  { id: 1, fide_number: 1503014, title: 1, name: 'Magnus', last_name: 'Carlsen', fed: 'NOR', elo: 2847, games_number: 0, b_day: '1990', gender: 1, ranked_player: true, k_value: 20, ranked_player: true, last_elo_update:'04-26-2021' },
  { id: 2, fide_number: 2020009, title: 1, name: 'Fabiano', last_name: 'Caruana', fed: 'USA', elo: 2820, games_number: 0, b_day: '1992', gender: 1, ranked_player: true, k_value: 20, ranked_player: true, last_elo_update:'04-26-2021' },
  { id: 3, fide_number: 8603677, title: 1, name: 'Liren', last_name: 'Ding', fed: 'CHN', elo: 2791, games_number: 0, b_day: '1992', gender: 1, ranked_player: true, k_value: 20, ranked_player: true, last_elo_update:'04-26-2021' },
  { id: 4, fide_number: 4168119, title: 1, name: 'Ian', last_name: 'Nepomniachtchi', fed: 'RUS', elo: 2789, games_number: 0, b_day: '1990', gender: 1, ranked_player: true, k_value: 20, ranked_player: true, last_elo_update:'04-26-2021' },
  { id: 5, fide_number: 13300474, title: 1, name: 'Levon', last_name: 'Aronian', fed: 'ARM', elo: 2781, games_number: 0, b_day: '1982', gender: 1, ranked_player: true, k: 20, ranked_player: true, last_elo_update:'04-26-2021' },
  { id: 6, fide_number: 4126025, title: 1, name: 'Alexander', last_name: 'Grischuk', fed: 'RUS', elo: 2777, games_number: 0, b_day: '1983', gender: 1, ranked_player: true, k_value: 20, ranked_player: true, last_elo_update:'04-26-2021' },
  { id: 7, fide_number: 24116068, title: 1, name: 'Anish', last_name: 'Giri', fed: 'NED', elo: 2776, games_number: 0, b_day: '1994', gender: 1, ranked_player: true, k_value: 20, ranked_player: true, last_elo_update:'04-26-2021' },
  { id: 8, fide_number: 13401319, title: 1, name: 'Shakhriyar', last_name: 'Mamedyarov', fed: 'AZE', elo: 2770, games_number: 0, b_day: '1985', gender: 1, ranked_player: true, k_value: 20, ranked_player: true, last_elo_update:'04-26-2021' }
])

Game.create!([
  { player1_id: 1, player1_elo: 2847, player2_id: 5, player2_elo: 2781, result: 1, won: 1, player1_rtng_change: 0, player2_rtng_change: 0, round_id: 1 },
  { player1_id: 2, player1_elo: 2820, player2_id: 6, player2_elo: 2777, result: 1, won: 1, player1_rtng_change: 0, player2_rtng_change: 0, round_id: 1 },
  { player1_id: 3, player1_elo: 2791, player2_id: 7, player2_elo: 2776, result: 1, won: 1, player1_rtng_change: 0, player2_rtng_change: 0, round_id: 1 },
  { player1_id: 4, player1_elo: 2789, player2_id: 8, player2_elo: 2770, result: 1, won: 1, player1_rtng_change: 0, player2_rtng_change: 0, round_id: 1 }
])