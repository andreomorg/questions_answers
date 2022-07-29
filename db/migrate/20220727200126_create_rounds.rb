class CreateRounds < ActiveRecord::Migration[7.0]
  def change
    create_table :rounds, &:timestamps
  end
end
