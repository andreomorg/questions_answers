class AddRoundRefToAnswers < ActiveRecord::Migration[7.0]
  def change
    add_reference :answers, :round, foreign_key: true
  end
end
