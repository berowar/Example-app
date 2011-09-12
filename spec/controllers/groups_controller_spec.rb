require 'spec_helper'

describe GroupsController do

  before do
    authenticate_user
  end

  let(:group) { mock_model(Group) }

  describe "CRUD" do

    describe "GET index" do
      before do
        Group.stub!(:all) { group }
        get :index
      end
      it { response.should be_success }
      it { response.should render_template("index") }
      it { assigns[:groups].should == group }
    end

    describe "GET show" do
      before do
        Group.stub!(:find) { group }
        group.stub!(:users) { @user }
        get :show, :id => 1
      end
      it { response.should be_success }
      it { response.should render_template("show") }
      it { assigns[:group].should == group }
      it { assigns[:members].should == @user }
    end

    describe "GET new" do
      before do
        Group.stub!(:new) { group }
        get :new
      end
      it { response.should be_success }
      it { response.should render_template("new") }
      it { assigns[:group].should == group }
    end

    describe "GET edit" do
      before do
        Group.stub!(:find) { group }
        get :edit, :id => 1
      end
      it { response.should be_success }
      it { response.should render_template("edit") }
    end

    describe "POST create" do
      before do
        Group.stub!(:new) { group }
      end

      it "success" do
        group.stub!(:save) { true }
        post :create
        response.should redirect_to group_path(group)
      end

      # it "failure" do
      #   group.stub!(:save) { false }
      #   post :create
      #   response.should render_template("new")
      # end
    end

    describe "PUT update" do
      before do
        Group.stub!(:find) { group }
      end

      it "success" do
        group.stub!(:update_attributes) { true }
        put :update, :id => 1
        response.should redirect_to group_path(group)
      end

      # it "failure" do
      #   group.stub!(:update_attributes) { false }
      #   put :update, :id => 1
      #   response.should render_template("edit")
      # end
    end

  end

  describe "POST join_to_group" do
    before do
      Group.stub!(:find) { group }
      group.stub_chain(:users, :<<) { true }
      post :join_to_group, :group_id => 0
    end
    #it { response.should be_success }
    it { response.should redirect_to group_path(group) }
    it { flash[:notice].should == "You successful joined to Group" }
  end

end
