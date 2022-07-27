class AddPlayerRefToRounds < ActiveRecord::Migration[7.0]
  def change
    add_reference :rounds, :player, foreign_key: true
  end
end
