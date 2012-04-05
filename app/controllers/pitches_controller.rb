class PitchesController < ApplicationController

  # POST /pitches
  # POST /pitches.json
  # I intend for params to this action to be collected here:
  #   app/views/projects/show.html.haml
  #   app/views/projects/_pitch_form.html.haml
  def create
debugger
    @project = Project.find params[:project_id]
    # A pitch with no project is useless:
    if @project.blank?
      redirect_to '/', notice: 'You are here because pitch needs project.'
      return
    end
debugger
    if current_user.pitches.count > 30
      redirect_to '/', notice: 'You are out of pitches. You only get 30.'
      return
    end

    # Now that I'm happy with the @project, work on @pitch:
    @pitch = Pitch.new
    @pitch.user_id = current_user.id
    @pitch.project_id = params[:project_id]
debugger

    if @pitch.save
      the_notice = "Pitch sent to: #{@project.user.email}"
      the_notice << ", and copy sent to: #{current_user.email}"
      redirect_to @project, notice: the_notice
    else
      redirect_to '/', notice: 'You are here because of a data problem in the last POST.'
    end
  end # def create

end
