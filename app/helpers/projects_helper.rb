module ProjectsHelper

  def project_owner?(project)
    if(current_user.present? and (current_user.id == project.user.id))
      true
    else
      false
    end
  end # def project_owner?(project)

  def i_not_pitched_yet?(project)
    return true if current_user.blank?
    a_project = current_user.pitches.where("project_id = ?", project.id).first
    # if a_project.blank? then I've not pitched yet:
    a_project.blank?
  end # def i_not_pitched_yet?(project)

  def i_have_pitches?
    return false if current_user.blank?
    if current_user.pitches.present?
      current_user.pitches.count < Pitch.pitch_limit
    else
      # I've used no pitches yet.
      true
    end
  end # def i_have_pitches?

  def i_can_pitch?(project)
    return false if current_user.blank?
    project.present? and i_dont_own?(project) and i_have_pitches? and i_not_pitched_yet?(project)
  end # def i_can_pitch?(project)

  def i_have_invitations?
    return false if current_user.blank?
    current_user.invitations.count < Invitation.invitation_limit
  end # def i_have_invitations?

  def pitches_left
    return 0 if current_user.blank?
    Pitch.pitch_limit - current_user.pitches.count
  end

  def invitations_left_on project
    Invitation.invitation_limit - project.invitations.count
  end

end
