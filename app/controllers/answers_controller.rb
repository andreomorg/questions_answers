class AnswersController < ApplicationController
  def create
    if create_answers.errors.present?
      render json: create_answers.errors.messages, status: :bad_request
    else
      render status: :ok
    end
  end

  private

  def create_answers
    @create_answers ||= CreateAnswerService.new(params:).call
  end
end
