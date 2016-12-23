class CreateCurriculumsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :curriculums_users do |t|
      t.integer :curriculum_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end

    add_index :curriculums_users, [:curriculum_id, :user_id], unique: true
    add_index :curriculums_users, [:user_id, :curriculum_id]
  end
end
