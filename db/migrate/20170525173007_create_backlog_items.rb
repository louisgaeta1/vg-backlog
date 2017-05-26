class CreateBacklogItems < ActiveRecord::Migration
  def change
    create_table :backlog_items do |t|
      t.references :user
      t.integer :game_id, null: false
      t.integer :user_rating, null: false
      t.integer :hours_played, null: false

      t.timestamps(null: false)
    end
  end
end
