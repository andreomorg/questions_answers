class Question < ApplicationRecord
  has_many :options
  has_many :answers
  belongs_to :category
end
