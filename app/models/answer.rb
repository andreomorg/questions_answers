class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :option
  belongs_to :round

  validates :round, uniqueness: { scope: [:question] }

  validate :correct?, :option_belongs_question?

  def correct?
    option_correct = Option.find_by(question_id:, correct: true)
    return self.correct = false if option_correct.blank?

    self.correct = (option_correct.id == option_id)
  end

  def option_belongs_question?
    return if self.option.question_id == question_id

    errors.add(:original_url, message: 'Option does not belong to the question')
  end
end
