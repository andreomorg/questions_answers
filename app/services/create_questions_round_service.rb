class CreateQuestionsRoundService
  def initialize(round:, questions_round_model: QuestionsRound)
    @round = round
    @questions_round_model = questions_round_model
  end

  def call
    @round.category.questions.sample(3).each do |question|
      create_question_round(question)
    end
  end

  private

  def create_question_round(question)
    @questions_round_model.create(
      round_id: @round.id,
      question_id: question.id
    )
  end
end
