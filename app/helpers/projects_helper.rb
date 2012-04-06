module ProjectsHelper

  def project_owner?(project)
    if(current_user.present? and (current_user.id == project.user.id))
      true
    else
      false
    end
  end # def project_owner?(project)

  def i_not_pitched_yet?(project)
    a_project = current_user.pitches.where("project_id = ?", project.id).first
    # if a_project.blank? then I've not pitched yet:
    a_project.blank?
  end # def i_not_pitched_yet?(project)

  def i_have_pitches?
    current_user.pitches.count < Pitch.pitch_limit
  end # def i_have_pitches?

  def i_can_pitch?(project)
    project.present? and i_dont_own?(project) and i_have_pitches? and i_not_pitched_yet?(project)
  end # def i_can_pitch?(project)

  def i_have_invitations?
    current_user.invitations.count < Invitation.invitation_limit
  end # def i_have_invitations?
end
