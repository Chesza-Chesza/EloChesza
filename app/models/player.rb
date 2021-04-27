class Player < ApplicationRecord
  enum gender: [:W, :M]
  enum title: [:GM, :IM, :FM, :CM, :NM, :WGM, :WIM, :WFM, :WCM]
  
  # scope :games_of_tournament, ->(id) { where(player1_id: id) }

  def data_of_tournament(id)
    Game.where(round_id: Tournament.find(id).rounds.pluck(:id)).where(player1_id: self.id).or(Game.where(round_id: Tournament.find(2).rounds.pluck(:id)).where(player2_id: self.id))
  end

  def rtng_change
    self.map
  end
end


# una vez tengas los juagdores

# @players = Player.all ---> options_for_select / options_from_collection_for_select

# seleccionar el id del player 1 y  buscar un player con ese id
# seleccionar todos los id de player2 donde el plyer1 sea el id anterior y buscar todos los player con esos id