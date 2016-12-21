class CreateCurriculums < ActiveRecord::Migration[5.0]
  def change
    create_table :curriculums do |t|
      t.string :title, null: false
      t.text :subtitle
      t.text :description
      t.integer :creator_id

      t.timestamps
    end

    add_index :curriculums, :creator_id
  end
end
