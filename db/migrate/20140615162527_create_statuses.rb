class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.references :user
      t.integer :dungeon
      t.integer :floor

      t.timestamps
    end
  end
end
