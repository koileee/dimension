class Addnametochallenge < ActiveRecord::Migration[5.1]
  def change
    change_table :challenges do |t|
      t.string :challenge_name
    end
  end
end
