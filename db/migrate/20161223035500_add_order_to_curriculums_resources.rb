class AddOrderToCurriculumsResources < ActiveRecord::Migration[5.0]
  def up
    add_column :curriculums_resources, :order, :integer, default: 0
  end

  def down
    remove_column :curriculums_resources, :order, :integer
  end
end
