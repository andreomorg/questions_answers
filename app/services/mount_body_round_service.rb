class MountBodyRoundService
  def initialize(round:, answers: nil)
    @round = round
    @answers = answers
  end

  def call
    mount_body_rounds
  end

  private

  
end
