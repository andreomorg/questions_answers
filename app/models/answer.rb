class Answer < ApplicationRecord
  belongs_to :question, :option
end
