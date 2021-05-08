class Import::Games

  def initialize(file, tournament)
    @file = file
    @tournament = tournament
  end

  def self.init(file, tournament)
    processable_file = self.new(file, tournament)
    processable_file.process_file
  end

  def process_file
    csv = CSV.read(@file, headers: true, encoding: "ISO8859-1")
    csv.each do |row|
      @player1 = Player.find_by(fide_number: row['player1_id'])
      @player1 ||= Player.create(fide_number: row['player1_id'])
      
      @player2 = Player.find_by(fide_number: row['player2_id'])
      @player2 ||= Player.create(fide_number: row['player2_id'])
      
      result = row['result'].to_f
      round_id = row['round_id'].to_i

      game_result = result != 0.5 ? the_winner(round_id) : nil
      current_round = @tournament.rounds.find_by(number: round_id)
      round = current_round.present? ? current_round : Round.create!(date: Date.today, number: round_id, tournament: @tournament)

      game = round.games.build(player1_id: @player1.id, 
                        player2_id: @player2.id, 
                        round_id: round_id, 
                        winner: game_result,
                        result: result)

      players = [@player1, @player2]
      players.each do |player|
        game.gameplayers.build(player: player)
      end

      round.save
    end
  end

  def the_winner(id)
    id == @player1.id ? @player1 : @player2
  end
end
