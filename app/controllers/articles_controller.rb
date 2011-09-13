class ArticlesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :assign_group
  before_filter :find_article, :only => [:show, :edit, :update]
  respond_to :html

  def index
    @articles = @group.articles
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = @group.articles.build(params[:article])
    @article.author = current_user
    @article.save
    respond_with(@group, @article)
  end

  def edit
  end

  def update
    @article.update_attributes(params[:article])
    respond_with(@group, @article)
  end

  private

  def assign_group
    @group = Group.find(params[:group_id])
  end

  def find_article
    @article = @group.articles.find(params[:id])
  end
end
