class CreateLunches < ActiveRecord::Migration[8.0]
  def change
    create_table :lunches do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.date :date, null: false

      t.timestamps
    end
  end
end
