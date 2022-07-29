class ResultRoundSerializer < ActiveModel::Serializer
  attributes :result

  def result
    {
      round: {
        id: object.id,
        player_id: object.player_id,
        total_questions:,
        total_answered_questions:,
        total_correct_answers:
      }
    }
  end

  private

  def total_questions
    object.answers.select('distinct(question_id)').count
  end

  def total_answered_questions
    object.answers.count
  end

  def total_correct_answers
    object.answers.where(correct: true).count
  end
end
