class RoundsController < ApplicationController
  def create
    if create_round.errors.present?
      render json: create_round.errors.messages, status: :bad_request
    else
      render json: create_round, serializer: RoundSerializer
    end
  end

  def show
    if round
      render json: round, serializer: RoundSerializer
    else
      render json: {}, status: :unprocessable_entity
    end
  end

  def result
    if round
      render json: round, serializer: ResultRoundSerializer
    else
      render json: {}, status: :unprocessable_entity
    end
  end

  private

  def round
    @round = Round.find(round_result_params[:round_id])
  end

  def create_round
    @create_round ||= CreateRoundService.new(params: round_params).call
  end

  def round_params
    params.require(:round).permit(:player_name, :category_id)
  end

  def round_result_params
    params.permit(:round_id)
  end
end
