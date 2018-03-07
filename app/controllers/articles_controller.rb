class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_param)

    if @article.save

      redirect_to @article #相当于 redirect_to 'show'
    else
     render 'new'
    end

      #redirect_to 'index'
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_param)

      redirect_to @article #相当于 redirect_to 'show'
    else
      render 'edit'
    end
  end

   def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end



  private
  def article_param
    params.require(:article).permit(:title, :text)
  end

end
