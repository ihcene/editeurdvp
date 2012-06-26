class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string    :title
      t.text      :content
      
      t.string    :ancestry
      
      t.timestamps
    end
    
    add_index :sections, :ancestry 
  end
end
