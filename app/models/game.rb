class Game < ApplicationRecord
  belongs_to :round
  # belongs_to :opponent, class_name: "Player", foreign_key: "player2_id"
  # belongs_to :player, class_name: "Player", foreign_key: "player1_id"
end

