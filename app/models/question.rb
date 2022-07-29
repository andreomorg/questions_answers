class Question < ApplicationRecord
  validates :description, presence: true
  has_many :options
  has_many :answers
  belongs_to :category
end
