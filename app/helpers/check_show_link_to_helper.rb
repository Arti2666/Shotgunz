module CheckShowLinkToHelper
  def check_show
    if current_user.id == @list.user_id
      link_to "delete", list_path(@list), method: :delete
    else
      if @list.belongs_to_user?(current_user)
        # Bouton delete my shotgunz à implanter
        "ok"
      else
        link_to "shotgunz !", list_shotguns_path(@list.id), method: :post
      end
    end
  end
end
