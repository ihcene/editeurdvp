class Column < ActiveRecord::Base
  attr_accessible :id_dvp, :title, :url
  validates_uniqueness_of :title 
  
  default_scope order(:title)
  
  ALL = self::all.map{ |e| [e.title, e.id]}
end
                   