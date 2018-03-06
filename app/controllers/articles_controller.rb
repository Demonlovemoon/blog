class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
  end

  def create
    @article = Article.new(article_param)
    @article.save
    redirect_to @article #相当于 redirect_to 'show'
    #redirect_to 'index'
  end

  def show
    @article = Article.find(params[:id])
  end

  private
  def article_param
    params.require(:article).permit(:title, :text)
  end

end
