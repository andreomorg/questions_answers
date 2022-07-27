class CreateRoundService
  def initialize(params:, round_model: Round)
    @params = params
    @round_model = round_model
  end

  def call
    @round_model.create(player_id: find_player.id, category_id: @params[:category_id])
  end

  private

  def find_player
    Player.find_by(name: @params[:player_name])
  end
end
