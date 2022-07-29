class AddCategoryRefToRounds < ActiveRecord::Migration[7.0]
  def change
    add_reference :rounds, :category, foreign_key: true
  end
end
