class CreateResourcesTags < ActiveRecord::Migration[5.0]
  def change
    create_table :resources_tags do |t|
      t.integer :resource_id, null: false
      t.integer :tag_id, null: false

      t.timestamps
    end

    add_index :resources_tags, [:resource_id, :tag_id], unique: true
    add_index :resources_tags, [:tag_id, :resource_id]
  end
end
