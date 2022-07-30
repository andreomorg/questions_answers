class RoundSerializer < ActiveModel::Serializer
  attributes :round

  def round
    {
      round: {
        id: object.id,
        player_id: object.player_id,
        questions:mount_questions,
        answers: mount_answers
      }
    }
  end

  private

  def mount_answers
    return [] if object.answers.blank?

    object.answers.map do |answer|
      {
        id: answer.id,
        question_id: answer.question_id,
        option_id: answer.option_id,
        correct: answer.correct
      }
    end
  end

  def mount_questions
    object.category.questions.sample(3).map do |question|
      {
        id: question.id,
        description: question.description,
        options: mount_options(question.options)
      }
    end
  end

  def mount_options(options)
    options.map do |option|
      {
        id: option.id,
        label: option.label
      }
    end
  end
end
