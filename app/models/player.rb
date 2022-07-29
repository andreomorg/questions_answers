class Player < ApplicationRecord
  validates :name, presence: true
  has_many :rounds
end
