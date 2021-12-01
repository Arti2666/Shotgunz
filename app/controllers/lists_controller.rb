class ListsController < ApplicationController
  before_action :authenticate_user!, except: %I[show index]

  def index
    # @public_list = List.public_lists
    @lists = List.includes(:user).active.public_lists
    if current_user.nil?
      @priv_lists = []
      @shotguns = []
    else
      @priv_lists = List.where("User_id =? ", current_user.id)
      my_tag = current_user.shotguns.pluck(:list_id)
      @shotguns = List.includes(shotguns: :user).active.where("id IN (?)", my_tag)
    end
  end

  def show
    @list = List.find(params[:id])
    if user_signed_in?
      @chatroom = @list.chatroom
      @message = Message.new(user_id: current_user.id, chatroom_id: @chatroom.id)
    end
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

      @chatroom = Chatroom.new
      @chatroom.list_id = @list.id
      @chatroom.save

      if @list.public
        IndexChannel.broadcast_to(
        IndexChannel::PUBLIC_CHANNEL,
        render_to_string(partial: "list", locals: { list: @list })
        )
      end
      redirect_to list_path(@list)

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
