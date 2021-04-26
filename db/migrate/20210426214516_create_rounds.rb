class CreateRounds < ActiveRecord::Migration[6.1]
  def change
    create_table :rounds do |t|
      t.date :date
      t.integer :number
      t.references :tournament, null: false, foreign_key: true

      t.timestamps
    end
  end
end
