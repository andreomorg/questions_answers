class RoundsController < ApplicationController
  def create
    if create_round.errors.present?
      render json: create_round.errors.messages, status: :bad_request
    else
      render json: create_round, serializer: RoundSerializer
    end
  end

  def show
    round = Round.find(params[:round_id])
    if round
      render json: round, serializer: RoundSerializer
    else
      render json: {}, status: :unprocessable_entity
    end
  end

  def answers
    if create_answers.errors.present?
      render json: create_answers.errors.messages, status: :bad_request
    else
      render status: :ok
    end
  end

  def result
    round = Round.find(params[:round_id])
    if round
      render json: round, serializer: ResultRoundSerializer
    else
      render json: {}, status: :unprocessable_entity
    end
  end

  private

  def create_answers
    @create_answers ||= CreateAnswerService.new(params:).call
  end

  def create_round
    @create_round ||= CreateRoundService.new(params: params[:round]).call
  end
end