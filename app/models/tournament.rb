class Tournament < ApplicationRecord
  has_and_belongs_to_many :referees
  has_many :rounds
  enum system: %i[:Swiss :Round_Robin :Teams :Other]
  enum time_control: %i[:Standard :Rapid :Blitz]
end
