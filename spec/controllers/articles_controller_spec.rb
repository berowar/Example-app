require 'spec_helper'

describe ArticlesController do

  before do
    authenticate_user
  end

  let(:article) { mock_model(Article) }
  let(:group) { mock_model(Group) }

  describe "CRUD" do

    before do
      Group.stub!(:find) { group }
    end

    describe "GET index" do
      before do
        group.stub!(:articles) { article }
        get :index, :group_id => 1
      end
      it { response.should be_success }
      it { response.should render_template("index") }
      it { assigns[:articles].should == article }
    end

    describe "GET show" do
      before do
        group.stub_chain(:articles, :find) { article }
        get :show, :group_id => 1, :id => 1
      end
      it { response.should be_success }
      it { response.should render_template("show") }
      it { assigns[:article].should == article }
    end

    describe "GET new" do
      before do
        Article.stub!(:new) { article }
        get :new, :group_id => 1
      end
      it { response.should be_success }
      it { response.should render_template("new") }
      it { assigns[:article].should == article }
    end

    describe "GET edit" do
      before do
        group.stub_chain(:articles, :find) { article }
        get :edit, :group_id => 1, :id => 1
      end
      it { response.should be_success }
      it { response.should render_template("edit") }
    end

    describe "POST create" do
      before do
        group.stub_chain(:articles, :build) { article }
        article.stub!(:author=) { true }
      end

      it "success" do
        article.stub!(:save) { true }
        post :create, :group_id => 1
        response.should redirect_to group_article_path(group, article)
      end

      # it "failure" do
      #   article.stub!(:save) { false }
      #   post :create,:group_id => 1
      #   response.should render_template("new")
      # end
    end

    describe "PUT update" do
      before do
        group.stub_chain(:articles, :find) { article }
      end

      it "success" do
        article.stub!(:update_attributes) { true }
        put :update, :group_id => 1, :id => 1
        response.should redirect_to group_article_path(group, article)
      end

      # it "failure" do
      #   article.stub!(:update_attributes) { false }
      #   put :update, :group_id => 1, :id => 1
      #   response.should render_template("edit")
      # end
    end

  end

end
