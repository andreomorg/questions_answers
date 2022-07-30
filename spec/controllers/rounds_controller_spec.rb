require 'rails_helper'

RSpec.describe RoundsController, type: :controller do
  let(:category) { Category.create(name: 'Matematica') }
  context 'create' do
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

  context 'show' do
    it 'then return a round, questions, options and answers' do
      player = Player.create(name: 'Andreo')
      question = Question.create(description: 'Quanto é 1+1', category_id: category.id)
      option = Option.create(label: '2', question_id: question.id, correct: true)
      round = Round.create(category_id: category.id, player_id: player.id)
      Answer.create(round_id: round.id, question_id: question.id, option_id: option.id)
      get 'show', params: { round_id: round.id }

      expect(response).to have_http_status(:ok)
      expect(response.body).to include('round')
    end
  end

  context 'answers' do
    it 'then create a answer for a round' do
      player = Player.create(name: 'Andreo')
      question = Question.create(description: 'Quanto é 1+1', category_id: category.id)
      option = Option.create(label: '2', question_id: question.id, correct: true)
      round = Round.create(category_id: category.id, player_id: player.id)
      post 'answers', params: {
        answer: {
          question_id: question.id,
          option_id: option.id
        },
        round_id: round.id
      }

      expect(response).to have_http_status(:ok)
    end
  end

  context 'result' do
    it 'then return result of the round' do
      player = Player.create(name: 'Andreo')
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
