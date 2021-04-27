class Tournament < ApplicationRecord
  belongs_to :referees
  has_many :rounds
end
