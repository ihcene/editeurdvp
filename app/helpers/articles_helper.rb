module ArticlesHelper
  def summarize(node)
    # recursive function
    
    if node.subsections.length > 0
      content_tag :ol do
        node.subsections.map do |section|
          content_tag :li, link_to(sanitize(section.title), :anchor => "section#{section.id}") + summarize(section)
        end.join.html_safe
      end
    end
    
  end
  
  def continue! xml, node
    node.subsections.each do |section|
      xml.section :id => "section#{section.id}" do
        xml.title   section.title
        
        xml << xml_tranform(section.content)
        
        continue! xml, section
      end
    end
  end
  
  def xml_tranform(str)
    return "" if str.blank?
    transformations = {
      '<a'    => '<link',
      '</a>'  => '</link>',
      '<p'    => '<paragraph',
      '</p>'  => '</paragraph>',
      '<br>'  => '<br />',
      '<ol'   => '<liste',
      '</ol>' => '</liste>',
      '<ul'   => '<liste',
      '</ul>' => '</liste>',
      '<li>'  => '<element>',
      '</li>' => '</element>',
      '<img'  => '<image',
      '&nbsp;'=> ' '
    }
    
    transformations.each_pair do |k, v|
      str.gsub!(k, v)
    end
    
    
    # Exceptionnal : Close img tags
    str.gsub!(/(<image [^>]+)>/, '\1 />')
    
    str
  end
end
