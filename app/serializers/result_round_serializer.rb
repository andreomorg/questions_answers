class ResultRoundSerializer < ActiveModel::Serializer
  attributes :result

  def result
    {
      id: object.id,
      player_id: object.player_id,
      total_questions:,
      total_answered_questions:,
      total_correct_answers:
    }
  end

  private

  def total_questions
    QuestionsRound.where(round_id: object.id).count
  end

  def total_answered_questions
    object.answers.count
  end

  def total_correct_answers
    object.answers.where(correct: true).count
  end
end
