class ListsController < ApplicationController
  def index
    @lists = List.all
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
    raise
  end

  def destroy
    @list = List.find(params[:id])
    if @list.destroy
      redirect_to lists_path
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :description, :places, :category, :start_time, :end_time, :prebookspot)
  end
end
