class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.references  :column
      
      t.string      :meta_description, :meta_keywords
      t.string      :title_page, :title_article
      
      # We can't rely on the default timestamps, we need others
      t.datetime    :date_creation, :date_update
      
      t.string      :licence_author, :default => 'Developpez LLC'
      t.integer     :licence_type
      t.integer     :licence_year_start, :licence_year_end
      
      t.string      :server_path
      
      t.text        :synopsis
      
      # HTML
      t.boolean     :no_html_zip, :no_html_summary
      
      # Ebooks
      t.boolean     :no_ebook
      
      # PDF generation
      t.boolean     :no_pdf
      
      t.timestamps
    end
  end
end
