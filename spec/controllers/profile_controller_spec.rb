require 'spec_helper'

describe ProfileController do

  before do
    authenticate_user
  end

  let(:user) { @user }

  describe "GET 'show'" do
    before do
      get :show
    end
    it { response.should be_success }
    it { response.should render_template("show") }
    it { assigns[:user].should == user }
  end

  describe "PUT update" do
    before do
      user.stub!(:avatar=) { true }
    end

    it "success" do
      user.stub!(:update_attributes) { true }
      put :update
      response.should redirect_to profile_path
    end

    it "failure" do
      user.stub!(:update_attributes) { false }
      put :update
      response.should redirect_to profile_path
    end
  end

end
