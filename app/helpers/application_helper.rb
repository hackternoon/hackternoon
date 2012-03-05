module ApplicationHelper

  def i_own?(object)
    if(current_user.present? and object.user.present? and object.user.id.present? and (current_user.id == object.user.id))
      true
    else
      false
    end
  end

end
