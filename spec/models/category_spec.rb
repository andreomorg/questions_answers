require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'when is a valid name' do
    it 'then create a category' do
      category = Category.new(name: 'Matematica')

      expect(category.valid?).to be(true)
    end
  end

  context 'when is a invalid name' do
    it 'then dont create a category' do
      category = Category.new

      expect(category.valid?).to be(false)
    end
  end
end
