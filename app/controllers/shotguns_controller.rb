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
        BackCheck5MinJob.set(wait_until: 2.minutes.from_now).perform_later(@shotgun.id)
        flash[:notice] = "Countdown has started ⏱😈"
        redirect_to new_user_registration_path
      else
        redirect_to list_path(@shotgun.list_id)
      end
    else
      render "lists/show"
    end
  end

  def destroy
    @shotgun = Shotgun.find_by('user_id= ? AND list_id= ?', current_user.id, params[:id])
    if @shotgun.destroy
      redirect_to lists_path
    end
  end
end
