module CheckShowLinkToHelper
  def check_show
    if current_user.id == @list.user_id
      link_to "delete", list_path(@list), method: :delete
    else
      if @list.belongs_to_user?(current_user)
        # Bouton delete my shotgunz à implanter
        link_to "Delete my shotgun", list_shotgun_path(@list.id), method: :delete
      else
        link_to "shotgun !", list_shotguns_path(@list.id), method: :post
      end
    end
  end
end
