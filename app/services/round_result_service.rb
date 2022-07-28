class RoundResultService
  def initialize(round)
    @round = round
  end

  def call
    round_result
  end

  private

  def round_result
    {
      round: {
        id: @round.id,
        player_id: @round.player_id,
        total_questions:,
        total_answered_questions:,
        total_correct_answers:
      }
    }
  end

  def total_questions
    @round.answers.select('distinct(question_id)').count
  end

  def total_answered_questions
    @round.answers.count
  end

  def total_correct_answers
    @round.answers.where(correct: true).count
  end
end
