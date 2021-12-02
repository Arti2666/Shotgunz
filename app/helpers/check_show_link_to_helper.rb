module CheckShowLinkToHelper
  def check_shotgun_btn
    if current_user && @list.belongs_to_user?(current_user)
      link_to "Cancel", list_shotgun_path(@list.id), method: :delete, class: "shotgun-cta"
    else
      if session[:list_ids].present? && session[:list_ids].include?(@list.id)
        link_to "Register!!", new_user_registration_path, class: "shotgun-cta"
      else
        link_to "Shotgun !", list_shotguns_path(@list.id), method: :post, class: "shotgun-cta", id: "btn-shotgun-show"
      end
    end
  end

  def check_delete_btn
    link_to "Delete List", list_path(@list), method: :delete if current_user && current_user.id == @list.user_id
  end
end
