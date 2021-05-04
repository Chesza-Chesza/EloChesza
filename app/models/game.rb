class Game < ApplicationRecord
  belongs_to :round
  has_many :players, through: :gameplayer

  def opponent_of(player)
    opponent_id = self.player1_id != player.id ? self.player1_id : self.player2_id
    Player.find(opponent_id)
  end

  def result_of(player)
    return self.result if self.result == 0.5

    player.id == self.won ? 1 : 0
  end
end

