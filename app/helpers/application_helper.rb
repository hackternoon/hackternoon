module ApplicationHelper

  # If I own an object, I often want to edit it.
  def i_own?(object)
    if(current_user.present? and object.user.present? and object.user.id.present? and (current_user.id == object.user.id))
      true
    else
      false
    end
  end # def i_own?(object)

  # If I dont own an object, I sometimes want to know that.
  def i_dont_own?(object)
    if(current_user.present? and object.user.present? and object.user.id.present? and (current_user.id == object.user.id))
      false
    else
      true
    end
  end # def i_dont_own?(object)

  # In production I want users talking to https://hackternoon.herokuapp.com
  def sslhost
    if ENV['RAILS_ENV'] == 'production'
      "https://hackternoon.herokuapp.com"
    else
      ""
    end
  end # def sslhost
end
