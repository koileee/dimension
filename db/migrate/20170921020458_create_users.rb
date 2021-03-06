class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true
      t.string :fname, null: false
      t.string :lname, null: false
      t.string :password, null: false

      t.timestamps
    end
  end
end
