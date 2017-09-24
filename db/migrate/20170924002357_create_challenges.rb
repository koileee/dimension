class CreateChallenges < ActiveRecord::Migration[5.1]
  def change
    create_table :challenges do |t|
      t.integer :type
      t.integer :point_value
      t.timestamps 
    end
  end
end
