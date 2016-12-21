class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.integer :rating
      t.integer :difficulty
      t.integer :completion_minutes
      t.string  :feedbackable_type, null: false
      t.integer :feedbackable_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :feedbacks, [:feedbackable_type, :feedbackable_id]
    add_index :feedbacks, :user_id
    add_index :feedbacks, [:feedbackable_type, :feedbackable_id, :user_id],
              unique: true, name: "feedbackable_user"

  end
end
