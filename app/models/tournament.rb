class Tournament < ApplicationRecord
<<<<<<< HEAD
  belongs_to :referees
  has_many :rounds
=======
  has_and_belongs_to_many :referees
  has_many :rounds
  enum system: [:Swiss, :Round_Robin, :Teams, :Other]
  enum time_control: [:Standard, :Rapid, :Blitz]
>>>>>>> test
end
