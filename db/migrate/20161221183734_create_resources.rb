class CreateResources < ActiveRecord::Migration[5.0]
  def change
    create_table :resources do |t|
      t.integer :submitter_id
      t.integer :category_id
      t.string :title, null: false
      t.text :subtitle
      t.text :description
      t.integer :media_type
      t.string :credits

      t.timestamps
    end

    add_index :resources, :submitter_id
  end

end
