class ShotgunsController < ApplicationController
  before_action :authenticate_user!, except: :create

  def create
    @shotgun = Shotgun.new
    @shotgun.user = (current_user ? current_user : nil)
    @list = List.find(params[:list_id])
    @shotgun.list = @list
    if @shotgun.save
      session[:shotgun_id] = @shotgun.id
      if @shotgun.user_id.nil?
        redirect_to new_user_registration_path
      else
        redirect_to root_path
      end
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
