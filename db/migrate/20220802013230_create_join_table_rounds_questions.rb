class CreateJoinTableRoundsQuestions < ActiveRecord::Migration[7.0]
  def change
    create_join_table :rounds, :questions do |t|
      # t.index [:round_id, :question_id]
      # t.index [:question_id, :round_id]
    end
  end
end
