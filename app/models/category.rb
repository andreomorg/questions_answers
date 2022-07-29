class Category < ApplicationRecord
  validates :name, presence: true
  has_many :questions
  has_many :rounds
end
