require 'rails_helper'

RSpec.describe Player, type: :model do
  context 'when is a valid name' do
    it 'then create a player' do
      player = Player.new(name: 'Andreo')

      expect(player.valid?).to be(true)
    end
  end

  context 'when is a invalid name' do
    it 'then dont create a player' do
      player = Player.new

      expect(player.valid?).to be(false)
    end
  end
end
