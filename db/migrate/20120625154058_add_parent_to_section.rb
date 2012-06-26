class AddParentToSection < ActiveRecord::Migration
  def change
    remove_column :sections, :ancestry
    
    add_column :sections, :parent_id, :integer
    add_column :sections, :order,     :integer
    add_column :sections, :depth,     :integer
  end
end
