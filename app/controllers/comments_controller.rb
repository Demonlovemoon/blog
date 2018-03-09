class CommentsController < ApplicationController
  http_basic_authenticate_with name: "xx", password: "123", only: :destroy

  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.create(comment_params)
    @comment.article = @article
    # 另一种写法
    # @comment = @article.comments.create(comment_params)
    @comment.save
    redirect_to article_path(@article)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.delete
    redirect_to article_path(@comment.article)
  end

  private
  def comment_params
    comment_params = params[:comment].permit(:commenter, :body)
  end

end
