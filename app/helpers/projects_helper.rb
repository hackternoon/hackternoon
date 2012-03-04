module ProjectsHelper

  def project_owner?(project)
    if(current_user.present? and (current_user.id == project.user.id))
      true
    else
      false
    end
  end

end
