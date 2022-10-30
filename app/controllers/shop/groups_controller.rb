class Shop::GroupsController < ApplicationController
  before_action :authenticate_shop!

  def index
    @groups = Group.all
    @group = Group.new

  end

  def create
    @group = current_shop.owned_groups.new(group_params)
    @group.owner_id = current_shop.id
    @group.shops << current_shop  # @group.shops << current_shop  @group.shopsに追加しているという記述
    if @group.save
      redirect_to groups_path(@group)
    else
      render :index
    end
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to groups_path
    else
      render :index
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.shops.delete(current_shop)
    redirect_to groups_path
  end


  def join
    @group = Group.find(params[:group_id])
    @group.shops << current_shop
    redirect_to groups_path
  end

  def all_destroy
    @group = Group.find(params[:group_id])
    if @group.destroy
      redirect_to groups_path
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :introduction, :profile_image, :status)
  end

end
