xml.instruct!

xml.document do
  xml.entete do 
    xml.rubrique      @article.column_id
    
    xml.meta do 
      xml.description @article.meta_description
      xml.keywords    @article.meta_keywords
    end
    
    xml.title do 
      xml.page        @article.title_page
      xml.article     @article.title_article
    end
    
    xml.creation      @article.date_creation.try :to_date
    xml.miseajour     @article.date_update.try :to_date
    
    xml.licauteur     @article.licence_author
    xml.lictype       @article.licence_type
    xml.licannee      @article.licence_annee
    
    xml.serveur       @article.column.try(:title)
    xml.chemin        "/#{@article.server_path}/"
    xml.urlhttp       "http://#{@article.column.try(:url)}/#{@article.server_path}"
    
    xml.nopdf         if @article.no_pdf
    xml.nozip         if @article.no_html_zip
    xml.noebook       if @article.no_ebook
    xml.nosummary     if @article.no_html_summary
  end
  
  xml.synopsis do
    xml <<            xml_tranform(@article.synopsis)
  end
  
  xml.summary do
    continue!(xml, @article)
  end
end