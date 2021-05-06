class CreateGameplayers < ActiveRecord::Migration[6.1]
  def change
    create_table :gameplayers do |t|
      t.integer :rtng_change
      t.references :game, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
