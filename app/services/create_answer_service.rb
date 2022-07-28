class CreateAnswerService
  def initialize(params:, answer_model: Answer)
    @params = params
    @answer_model = answer_model
  end

  def call
    @answer_model.create(
      question_id: @params[:answer][:question_id],
      option_id: @params[:answer][:option_id],
      round_id: @params[:round_id]
    )
  end
end
