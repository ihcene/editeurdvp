class CreateColumns < ActiveRecord::Migration
  def change
    create_table :columns do |t|
      t.string      :title, :url
      t.integer     :id_dvp

      t.timestamps
    end
  end
end
