require 'rails_helper'

RSpec.describe Option, type: :model do
  context 'when is a valid option' do
    it 'then create a option' do
      category = Category.create(name: 'Matematica')
      question = Question.create(description: 'Quanto é 1+1', category_id: category.id)
      option = Option.create(label: '2', question_id: question.id)

      expect(option.valid?).to be(true)
    end
  end

  context 'when is a invalid option' do
    it 'because question is empty' do
      option = Option.create(label: '2')

      expect(option.valid?).to be(false)
    end
  end
end
