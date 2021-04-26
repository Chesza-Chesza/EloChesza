class CreateTournaments < ActiveRecord::Migration[6.1]
  def change
    create_table :tournaments do |t|
      t.integer :event_code
      t.string :name
      t.string :city
      t.string :country
      t.integer :players_quantity
      t.date :start_date
      t.date :end_date
      t.integer :total_rounds, default: 1
      t.integer :system
      t.integer :time_control
      t.references :referee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
