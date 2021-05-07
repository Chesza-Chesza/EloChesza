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
      # byebug
      #Player.where(fide_number: 6500072)

      player1_id = Game.find(fide_number)
      player2_id = Game.find(fide_number)
      round_id = 1
      date = date.today
      n = 0
      number = n + 1
      elo = elo
      
      Game.create!(player1_id: player1_id, player2_id: player2_id, round_id: round_id, won: row["won"], result: row["result"])

      round = Round.find(id)
      if round.present?
        round = round_id
      else
        Round.create!(date: date, number: number, tournament_id: @tournament)
      end


      player = Player.find(id)
      if player.present?
        player1_id = player_id
      else
        Player.create!(id: row["player1_id"])
      end

      Gameplayer.create!(id: row["player1_id"], elo: elo, game_id: game_id)
    end
      
  end
  flash.now[:message]="CSV Import Successful"
end

# en base al id del la ronda, buscarla
# Si encuentro la ronda, la guardo en una variable, de lo contrario creo una ronda y le entrego ese id.
# Una vez tengo en una variable la ronda/instancia nueva de ronda le asigno los valores 
# necesario, recuerda el id del torneo se saca desde: @tournament
# genero la instancia de game y le asigno los valores necesarios para su creación
# En base al id del player, buscarlo y si no se encuentra se genera pero sin ranking
# se asignan los valores correspondientes que vienen en el csv
# una vez creadas las instancias, se guardan los elementos
# se retorna una respuesta para entregarle al usaurio un feedback