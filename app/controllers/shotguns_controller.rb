class ShotgunsController < ApplicationController
  def create
    @shotgun = Shotgun.new
    @shotgun.user_id = current_user.id
    @list = List.find(params[:list_id])
    @shotgun.list_id = @list.id
    if @shotgun.save
      redirect_to root_path
    else
      render "lists/show"
    end
  end

  def destroy
    @shotgun = Shotgun.find(params[:id])
    if @shotgun.destroy
      redirect_to lists_path
    end
  end
end
