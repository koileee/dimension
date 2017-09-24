class Add < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.integer :rbcoins
      t.integer :user_type
    end
  end
end
