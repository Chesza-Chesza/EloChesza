class Game < ApplicationRecord
  belongs_to :round
  has_many :players, through: :gameplayer
end

