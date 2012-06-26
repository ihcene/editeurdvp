class SectionsController < ApplicationController
  def create
    @article = Article.find params[:article_id]
    @section = @article.sections.new params[:section]
    
    if @section.save
      redirect_to edit_article_section_path(@article, @section)
    else
      render :action => 'edit'
    end
  end
  
  def edit
    @section = Article.find(params[:article_id]).sections.find params[:id]
  end
  
  def update
    @section = Article.find(params[:article_id]).sections.find params[:id]
    
    if @section.update_attributes params[:section]
      redirect_to compose_article_url(@section.article, :anchor => "section#{@section.id}")
    else
      render :action => 'edit'
    end
  end
end
