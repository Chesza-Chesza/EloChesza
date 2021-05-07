class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.integer :fide_number
      t.integer :title
      t.string :name, null: false
      t.string :last_name
      t.string :fed, null: false
      t.integer :gender
      t.date :b_day,  null: false
      t.boolean :ranked_player
      t.integer :elo,  null: false, default: 0
      t.integer :ranked_opponents
      t.integer :k_value
      t.datetime :last_elo_update

      t.timestamps
    end
  end
end
