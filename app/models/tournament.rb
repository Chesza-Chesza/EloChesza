class Tournament < ApplicationRecord
  has_and_belongs_to_many :referees
  has_many :rounds
  
  enum system: %i[swiss round_robin teams other]
  enum time_control: %i[standard rapid blitz]

  def self.to_csv
    attributes = %w{player1_id	player2_id	result	won	round_id	tournament_id}
    CSV.generate(headers: true) do |csv|
      csv << attributes
      
      all.each do |game, round|
        csv << game.round.attributes.values_at(*attributes)
      end
    end
  end
end