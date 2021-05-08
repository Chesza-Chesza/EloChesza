class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.integer :fide_number, index: true
      t.integer :title, default: 0
      t.string :first_name
      t.string :last_name
      t.string :fed, null: false
      t.integer :gender, default: 0
      t.date :b_day, default: '0000'
      t.boolean :ranked_player, default: true
      t.integer :elo, default: 0
      t.integer :ranked_opponents, default: 0
      t.integer :k_value
      t.datetime :last_elo_update

      t.timestamps
    end
  end
end
