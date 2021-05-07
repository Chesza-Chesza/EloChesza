class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.integer :player1_id, null: false
      t.integer :player2_id
      t.float :result, default: 0
      t.float :won, default: 0
      t.references :round, null: false, foreign_key: true

      t.timestamps
    end
  end
end
