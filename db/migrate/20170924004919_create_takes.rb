class CreateTakes < ActiveRecord::Migration[5.1]
  def change
    create_table :takes do |t|
      t.integer :challenge_id
      t.integer :user_id
      t.integer :score

      t.timestamps
    end
  end
end
