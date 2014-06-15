class CreateGuilds < ActiveRecord::Migration
  def change
    create_table :guilds do |t|
      t.references :user
      t.integer :fame, default: 0

      t.timestamps
    end
  end
end
