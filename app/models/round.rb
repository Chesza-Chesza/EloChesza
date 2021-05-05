class Round < ApplicationRecord
  belongs_to :tournament
  has_many :games
  accepts_nested_attributes_for :games
end