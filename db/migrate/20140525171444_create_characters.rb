class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.references :user
      t.string :name
      t.integer :hp
      t.integer :exp, default: 0
      t.integer :job
      t.integer :physical
      t.integer :mental
      t.integer :sensuous
      t.integer :social

      t.timestamps
    end
  end
end
