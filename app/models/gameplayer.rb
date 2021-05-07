class Gameplayer < ApplicationRecord
  belongs_to :game
  belongs_to :player


  def rtng_change
    Elo::Calculate.init self.player.elo, self.opponent.elo, self.game.result_of(self.player), self.player.k_value
  end

  def opponent
    opponent_id = self.game.player1_id != self.player_id ? self.game.player1_id : self.game.player2_id
    Player.find(opponent_id)
  end
end
