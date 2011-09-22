class CommentsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js

  def create
    article = Article.find(params[:article_id])
    @comment = article.comments.build(params[:comment])
    @comment.author = current_user
    @comment.save
    respond_with(article.group, article)
  end

end
