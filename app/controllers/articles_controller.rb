class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  
  def show
    @article = Article.find params[:id]
  end

  def show_by_slug
    @article = Article.find_by_server_path params[:slug]
    
    render :action => 'show', :layout => 'gabarit'
  end
  
  def new
    @article = Article.new params[:article]
  end
  
  def create
    @article = Article.new params[:article]
    
    if @article.save
      redirect_to article_by_slug_url(@article.server_path)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @article = Article.find params[:id]
  end
  
  def update
    @article = Article.find params[:id]
    
    if @article.update_attributes params[:article]
      redirect_to article_by_slug_url(@article.server_path)
    else
      render :action => 'edit'
    end
  end
  
  def compose
    @article = Article.find params[:id]
    
    render :action => 'show'
  end
  
  def updatesummary
    @article = Article.find params[:id]
    
    if @article.update_attributes params[:article]
      redirect_to article_by_slug_url(@article.server_path)
    else
      render :action => 'summarize'
    end
  end
  
  def summarize
    @article = Article.find params[:id]
  end
end
