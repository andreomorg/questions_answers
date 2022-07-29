require 'rails_helper'

RSpec.describe Round, type: :model do
  context 'when is a valid round' do
    it 'then create a round' do
      player = Player.create(name: 'andreo')
      category = Category.create(name: 'teste')
      round = Round.create(player_id: player.id, category_id: category.id)

      expect(round.valid?).to be(true)
    end
  end

  context 'when is a invalid round' do
    it 'because player is empty' do
      category = Category.create(name: 'teste')
      round = Round.create(category_id: category.id)

      expect(round.valid?).to be(false)
    end

    it 'because category is empty' do
      player = Player.create(name: 'andreo')
      round = Round.create(player_id: player.id)

      expect(round.valid?).to be(false)
    end
  end
end
