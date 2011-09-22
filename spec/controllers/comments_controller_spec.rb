require 'spec_helper'

describe CommentsController do
  before do
    authenticate_user
  end

  let(:article) { mock_model(Article, :group => mock_model(Group)) }
  let(:comment) { mock_model(Comment) }

  describe "POST create" do
    before do
      Article.stub(:find) { article }
      article.stub_chain(:comments, :build) { comment }
      comment.stub!(:author=) { true }
    end

    it "success" do
      comment.stub!(:save) { true }
      post :create, :article_id => 1
      response.should redirect_to group_article_path(article.group, article)
    end

    it "failure" do
      comment.stub!(:save) { false }
      post :create, :article_id => 1
      response.should redirect_to group_article_path(article.group, article)
    end
  end
end