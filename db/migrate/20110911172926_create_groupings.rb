class CreateGroupings < ActiveRecord::Migration
  def change
    create_table :groupings, :id => false do |t|
      t.integer :group_id
      t.integer :user_id

      t.timestamps
    end
    add_index :groupings, [:group_id, :user_id]
  end
end
