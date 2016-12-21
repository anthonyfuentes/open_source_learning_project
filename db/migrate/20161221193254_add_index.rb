class AddIndex < ActiveRecord::Migration[5.0]
  def change
    add_index :resources, :category_id
    
  end
end
