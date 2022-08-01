require 'rails_helper'

RSpec.describe RoundsController, type: :controller do
  let(:category) { Category.create(name: 'Matematica') }
  let(:player) { Player.create(name: 'Andreo') }

  context 'when call create' do
    it 'then create and return a round, questions and options' do
      Player.create(name: 'Andreo')
      question = Question.create(description: 'Quanto é 1+1', category_id: category.id)
      Option.create(label: '2', question_id: question.id, correct: true)
      post 'create', params: {
        round: {
          player_name: 'Andreo',
          category_id: category.id
        }
      }

      expect(response).to have_http_status(:ok)
      expect(response.body).to include('round')
    end
  end

  context 'when call show' do
    it 'then return a round, questions, options and answers' do
      question = Question.create(description: 'Quanto é 1+1', category_id: category.id)
      option = Option.create(label: '2', question_id: question.id, correct: true)
      round = Round.create(category_id: category.id, player_id: player.id)
      Answer.create(round_id: round.id, question_id: question.id, option_id: option.id)
      get 'show', params: { round_id: round.id }

      expect(response).to have_http_status(:ok)
      expect(response.body).to include('round')
    end
  end

  context 'when call result' do
    it 'then return result of the round' do
      question = Question.create(description: 'Quanto é 1+1', category_id: category.id)
      question2 = Question.create(description: 'Quanto é 1+2', category_id: category.id)
      option = Option.create(label: '2', question_id: question.id, correct: true)
      option2 = Option.create(label: '4', question_id: question2.id, correct: false)
      round = Round.create(category_id: category.id, player_id: player.id)
      Answer.create(round_id: round.id, question_id: question.id, option_id: option.id)
      Answer.create(round_id: round.id, question_id: question2.id, option_id: option2.id)
      post 'result', params: {
        round_id: round.id
      }

      expect(response).to have_http_status(:ok)
      expect(response.body).to include('result')
    end
  end
end
