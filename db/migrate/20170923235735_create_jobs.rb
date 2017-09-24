class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :poisition
      t.string :desc
      t.boolean :status
      t.integer :top_points
      t.datetime :end_date
      t.integer :user_id

      t.timestamps
    end
  end
end
