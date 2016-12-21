class CreateCategoriesResources < ActiveRecord::Migration[5.0]
  def change
    create_table :categories_resources do |t|
      t.integer :category_id, null: false
      t.integer :resource_id, null: false

      t.timestamps
    end

    add_index :categories_resources, [:category_id, :resource_id], unique: true
    add_index :categories_resources, [:resource_id, :category_id]
  end
end
