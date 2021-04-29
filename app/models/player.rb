class Player < ApplicationRecord
  has_many :games, through: :gameplayer
  enum gender: [:W, :M]
  enum title: [:GM, :IM, :FM, :CM, :NM, :WGM, :WIM, :WFM, :WCM]
  
  # scope :games_of_tournament, ->(id) { where(player1_id: id) }

  def data_of_tournament(id)
    Game.where(round_id: Tournament.find(id).rounds.pluck(:id)).where(player1_id: self.id).or(Game.where(round_id: Tournament.find(2).rounds.pluck(:id)).where(player2_id: self.id))
  end

  def rtng_change
    self.map { |game| Elo::Calculate.rtng_change(game.player1_elo, game.player2_elo, game.result, k_value, percentage) }
  end
end
