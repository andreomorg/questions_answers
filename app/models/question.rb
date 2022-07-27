class Question < ApplicationRecord
  has_many :options
  belongs_to :category
end
