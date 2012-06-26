class Section < ActiveRecord::Base
  attr_accessible :title, :content, :parent_id
  
  belongs_to    :article
  belongs_to    :parent, :class_name => "Section", :foreign_key => "parent_id"
  has_many      :subsections, :class_name => "Section", :foreign_key => "parent_id"
  
  validates_presence_of :title
end
