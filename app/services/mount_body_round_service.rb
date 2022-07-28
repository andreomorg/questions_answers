class MountBodyRoundService
  def initialize(round:, answers: nil)
    @round = round
    @answers = answers
  end

  def call
    mount_body_rounds
  end

  private

  def mount_body_rounds
    {
      round: {
        id: @round.id,
        player_id: @round.player_id,
        questions: mount_question,
        answers: @answers.presence || []
      }
    }
  end

  def mount_question
    array_of_questions = []
    @round.category.questions.sample(3).each do |category|
      array_of_questions << {
        id: category.id,
        description: category.description,
        options: mount_options(category.options)
      }
    end
    array_of_questions
  end

  def mount_options(options)
    array_of_options = []
    options.each do |option|
      array_of_options << {
        id: option.id,
        label: option.label
      }
    end
    array_of_options
  end
end
