class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :option
  belongs_to :round

  validate :correct?

  def correct?
    option_correct = Option.find_by(question_id:, correct: true)
    self.correct = (option_correct.id == option_id)
  end
end
