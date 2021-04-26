class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.integer :player1_id, null: false
      t.integer :player1_elo, default: 0
      t.integer :player2_id
      t.integer :player2_elo, default: 0
      t.integer :result, default: 0
      t.integer :won
      t.integer :player1_rtng_change
      t.integer :player2_rtng_change
      t.references :round, null: false, foreign_key: true

      t.timestamps
    end
  end
end
