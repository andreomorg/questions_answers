class RoundsController < ApplicationController
  def rounds
    create_round
    render json: { round: create_round }, status: :ok
  end

  private

  def create_round
    @create_round ||= CreateRoundService.new(params: params[:round]).call
  end
end
