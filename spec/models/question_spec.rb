require 'rails_helper'

RSpec.describe Question, type: :model do
  context 'when is a valid question' do
    it 'then create a option' do
      category = Category.create(name: 'teste')
      question = Question.create(description: 'Quanto é 1+1', category_id: category.id)

      expect(question.valid?).to be(true)
    end
  end

  context 'when is a invalid question' do
    it 'because category is empty' do
      question = Question.create(description: 'Quanto é 1+1')

      expect(question.valid?).to be(false)
    end
  end
end
