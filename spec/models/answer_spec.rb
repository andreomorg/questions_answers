require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:player) { Player.create(name: 'Andreo') }
  let(:round) { Round.create(category_id: category.id, player_id: player.id) }
  let(:category) { Category.create(name: 'Matematica') }
  let(:question) { Question.create(description: 'Quanto é 1+1', category_id: category.id) }

  describe 'when is a valid answer' do
    let(:correct_option) { Option.create(label: '2', question_id: question.id, correct: true) }
    let(:incorrect_option) { Option.create(label: '3', question_id: question.id, correct: false) }

    context 'and is a correct' do
      it 'then create a correct answer' do
        answer = Answer.create(round_id: round.id, question_id: question.id, option_id: correct_option.id)
        expect(answer.valid?).to be(true)
        expect(answer.correct).to be(true)
      end
    end

    context 'and is a incorrect' do
      before do
        Option.create(label: '2', question_id: question.id, correct: true)
      end

      it 'then create a incorrect answer' do
        answer = Answer.create(round_id: round.id, question_id: question.id, option_id: incorrect_option.id)
        expect(answer.valid?).to be(true)
        expect(answer.correct).to be(false)
      end
    end
  end

  context 'when is a invalid answer' do
    it 'then dont create' do
      answer = Answer.create(round_id: round.id, question_id: question.id)
      expect(answer.valid?).to be(false)
    end
  end
end
