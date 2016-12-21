class CreateCurriculumsResources < ActiveRecord::Migration[5.0]
  def change
    create_table :curriculums_resources do |t|
      t.integer :curriculum_id, null: false
      t.integer :resource_id, null: false

      t.timestamps
    end

    add_index :curriculums_resources, [:curriculum_id, :resource_id], unique: true
    add_index :curriculums_resources, [:resource_id, :curriculum_id]

    drop_table :categories_resources
  end
end
