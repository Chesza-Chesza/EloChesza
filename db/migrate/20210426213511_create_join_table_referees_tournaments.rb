class CreateJoinTableRefereesTournaments < ActiveRecord::Migration[6.1]
  def change
    create_join_table :referees, :tournaments do |t|
      t.index [:referee_id, :tournament_id]
      t.index [:tournament_id, :referee_id]
    end
  end
end
