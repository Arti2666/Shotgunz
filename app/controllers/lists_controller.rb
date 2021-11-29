class ListsController < ApplicationController
  before_action :authenticate_user!, except: %I[show index]

  def index
    @lists = List.includes(:user).active.public_lists
    if current_user.nil?
      @priv_lists = []
      @shotguns = []
    else
      @priv_lists = List.includes(:user).active.private_lists
      my_tag = current_user.shotguns.pluck(:list_id)
      @shotguns = List.includes(shotguns: :user).active.where("id IN (?)", my_tag)
    end
    # @lists = List.all.active.private_lists.where("user_id= ?", current_user.id)
    # Shotgun.where(user_id: 4).each {|x| puts x.list_id}
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    if @list.save
      if @list.prebookspot
        @shotgun = Shotgun.new
        @shotgun.user_id = current_user.id
        @shotgun.list_id = @list.id
        @shotgun.save
      end
      redirect_to lists_path
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:id])
    if @list.destroy
      redirect_to lists_path
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :description, :places, :category, :start_time, :end_time, :prebookspot, :public)
  end
end
