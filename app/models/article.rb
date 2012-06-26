class Article < ActiveRecord::Base
  belongs_to :column
  
  has_many :sections
  
  attr_protected
  
  LicenceTypes = {
    :"1" => "Article perso", 
    :"2" => "Article perso avec sources", 
    :"3" => "Article collectif", 
    :"4" => "Page source/faq",
    :"5" => "Article MS",
    :"6" => "Article MS avec sources",
    :"7" => "Creative Commons"
  } 
  
  validates_presence_of :title_page, :title_article
  
  validates :column, :presence => true
  validates_format_of :summary, :with => /(\*{1,}\s+[^\n]+\n){2,}/, :if => proc { |e| e['summary'] != nil }
  
  validates_presence_of :server_path
  validates_format_of :server_path, :with => /^[a-z\d-]+(\/[a-z\d-]+)*$/i
  
  def summary=(summ)
    @summary = summ
    
    if sections.length == 0
      
    else
      
    end
  end
  
  def summary
    @summary
  end
  
  def subsections
    sections.where(:parent_id => nil)
  end
  
  def title
    title_article || title_page
  end
  
  def licence_annee
    [licence_year_start, licence_year_end].compact.sort.join('~')
  end
end
