class Player < ApplicationRecord
  has_many :games, through: :gameplayer
  enum gender: %i[f, m]
  enum title: %i[gm, im, fm, cm, nm, wgm, wim, wfm, wcm]
  
  # scope :games_of_tournament, ->(id) { where(player1_id: id) }

  def data_of_tournament(id)
    Game.where(round_id: Tournament.find(id).rounds.pluck(:id)).where(player1_id: self.id).or(Game.where(round_id: Tournament.find(id).rounds.pluck(:id)).where(player2_id: self.id))
  end

  def rtng_change
    self.map { |game| Elo::Calculate.rtng_change(game.player1_elo, game.player2_elo, game.result_of(self), k_value, percentage) }
  end

  def tournament_rtng(id)
    games = data_of_tournament(id)
    ratings = games.map { |game| Elo::Calculate.init(self.elo, game.opponent_of(self).elo, game.result_of(self), self.k_value) }
    ratings.sum
  end

  def full_name
    "#{first_name} #{last_name}"
  end

end
