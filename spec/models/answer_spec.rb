require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:player) { Player.create(name: 'Andreo') }
  let(:round) { Round.create(category_id: category.id, player_id: player.id) }
  let(:category) { Category.create(name: 'Matematica') }
  let(:question) { Question.create(description: 'Quanto é 1+1', category_id: category.id) }
  let(:correct_option) { Option.create(label: '2', question_id: question.id, correct: true) }

  describe 'when is a valid answer' do
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
      answer = Answer.create(round_id: round.id, option_id: correct_option.id)
      expect(answer.valid?).to be(false)
    end

    it 'then dont create because the option dont belong to question' do
      question_incorrect = Question.create(description: 'Quanto é 1+2', category_id: category.id)
      option_does_belong_question = Option.create(label: '2', question_id: question_incorrect.id, correct: false)

      answer = Answer.create(round_id: round.id, question_id: question.id, option_id: option_does_belong_question.id)
      expect(answer.valid?).to be(false)
      expect(answer.errors.present?).to be(true)
    end

    it 'then dont create because there is already an answer to this question in the round' do
      answer = Answer.create(round_id: round.id, question_id: question.id, option_id: correct_option.id)
      incorrect_answer = Answer.create(round_id: round.id, question_id: question.id, option_id: correct_option.id)

      expect(answer.valid?).to be(true)
      expect(incorrect_answer.valid?).to be(false)
      expect(incorrect_answer.errors.present?).to be(true)
    end
  end
end
