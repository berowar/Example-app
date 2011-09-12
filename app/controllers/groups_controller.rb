class GroupsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :assign_group
  respond_to :html

  def index
    @groups = Group.all
  end

  def show
    @members = @group.users
  end

  def new
  end

  def create
    @group.save
    respond_with(@group)
  end

  def edit
  end

  def update
    @group.update_attributes(params[:group])
    respond_with(@group)
  end

  def join_to_group
    @group = Group.find(params[:group_id])
    if @group.users << current_user
      flash[:notice] = "You successful joined to Group"
    end
    redirect_to @group
  end

  private

  def assign_group
    @group = params[:id] ? Group.find(params[:id]) : Group.new(params[:group])
  end

end
