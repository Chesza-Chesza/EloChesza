class CreateReferees < ActiveRecord::Migration[6.1]
  def change
    create_table :referees do |t|
      t.integer :fide_id
      t.string :name
      t.integer :title, default: 0

      t.timestamps
    end
  end
end
