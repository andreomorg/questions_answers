require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  context 'when call answers' do
    it 'then create a answer for a round' do
      category = Category.create(name: 'Matematica')
      player = Player.create(name: 'Andreo')
      question = Question.create(description: 'Quanto é 1+1', category_id: category.id)
      option = Option.create(label: '2', question_id: question.id, correct: true)
      round = Round.create(category_id: category.id, player_id: player.id)
      post 'create', params: {
        answer: {
          question_id: question.id,
          option_id: option.id
        },
        round_id: round.id
      }

      expect(response).to have_http_status(:ok)
    end
  end
end
