class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :option
  belongs_to :round

  validate :correct?, :duasrespostapramesmapergunta

  def correct?
    option_correct = Option.find_by(question_id:, correct: true)
    return self.correct = false if option_correct.blank?

    self.correct = (option_correct.id == option_id)
  end

  def duasrespostapramesmapergunta
    answer = Answer.find_by(question_id:, round_id:)
    errors.add(:answer, message: 'Ja existe uma resposta pra essa questao nesse round') if answer.present?
  end
end
