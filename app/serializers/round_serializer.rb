class RoundSerializer < ActiveModel::Serializer
  attributes :round

  def round
    {
      round: {
        id: object.id,
        player_id: object.player_id,
        questions: mount_question,
        answers: object.answers.presence || []
      }
    }
  end

  private

  def mount_question
    array_of_questions = []
    object.category.questions.sample(3).each do |question|
      array_of_questions << {
        id: question.id,
        description: question.description,
        options: mount_options(question.options)
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
