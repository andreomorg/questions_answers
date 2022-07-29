class RoundsController < ApplicationController
  def create
    render json: create_round, serializer: RoundSerializer
  end

  def show
    round = Round.find(params[:round_id])
    render json: round, serializer: RoundSerializer
  end

  def answers
    create_answers
    render status: :ok
  end

  def result
    round = Round.find(params[:round_id])
    render json: create_round_result(round), status: :ok
  end

  private

  def mount_body_round(round, answers)
    MountBodyRoundService.new(round:, answers:).call
  end

  def create_round_result(round)
    RoundResultService.new(round).call
  end

  def create_answers
    @create_answers ||= CreateAnswerService.new(params:).call
  end

  def create_round
    @create_round ||= CreateRoundService.new(params: params[:round]).call
  end
end
