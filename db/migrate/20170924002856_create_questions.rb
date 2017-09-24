class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :challenge_id
      t.text :question
      t.text :answers
      t.integer :correct

      t.timestamps
    end
  end
end
