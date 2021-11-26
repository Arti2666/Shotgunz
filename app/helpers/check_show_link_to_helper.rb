module CheckShowLinkToHelper
  def check_shotgun_btn
    if current_user && @list.belongs_to_user?(current_user)
      link_to "Delete my shotgun", list_shotgun_path(@list.id), method: :delete
    else
      link_to "Shotgun !", list_shotguns_path(@list.id), method: :post
    end
  end

  def check_delete_btn
    link_to "delete", list_path(@list), method: :delete if current_user && current_user.id == @list.user_id
  end
end
