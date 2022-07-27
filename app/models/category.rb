class Category < ApplicationRecord
  has_many :questions, :rounds
end
